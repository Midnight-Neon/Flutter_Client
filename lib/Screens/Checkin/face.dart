// Load model
void _loadModel() async {
    _anchors = UtilsFace().getAnchors(anchors);
    _interpreter =
        await Interpreter.fromAsset("models/face_detection_front.tflite");
    _inputShape = _interpreter.getInputTensor(0).shape;
    _imageProcessor = ImageProcessorBuilder()
        .add(ResizeOp(
            _inputShape[1], _inputShape[2], ResizeMethod.NEAREST_NEIGHBOUR))
        .add(_normalizeInput)
        .build();
    await _onStream();
  }

// Initialize camera ande get frames
 _onStream() async {
    final CameraDescription description =
        await ScannerUtils.getCamera(_direction);
    controller = CameraController(description, ResolutionPreset.medium,
        enableAudio: false);
    await controller.initialize();
    setState(() {});
    await controller.startImageStream((CameraImage image) async {
      if (_isDetecting) return;
      _isDetecting = true;
      Future.delayed(const Duration(seconds: 1), () {
        _tfLite(image);
        _isDetecting = false;
      });
    });
  }

// Proccess image from camera
_tfLite(CameraImage image) async {
    img.Image _img;
    if (!_isUpload) {
      if (Platform.isIOS)
        _img = img.Image.fromBytes(
            image.width, image.height, _concatenatePlanes(image.planes));
      else
        _img = await convertYUV420toImageColor(image);

      TensorImage tensorImage = TensorImage.fromImage(_img);
      tensorImage = _imageProcessor.process(tensorImage);

      TensorBuffer output0 = TensorBuffer.createFixedSize(
          _interpreter.getOutputTensor(0).shape,
          _interpreter.getOutputTensor(0).type);
      TensorBuffer output1 = TensorBuffer.createFixedSize(
          _interpreter.getOutputTensor(1).shape,
          _interpreter.getOutputTensor(1).type);

      Map<int, ByteBuffer> outputs = {0: output0.buffer, 1: output1.buffer};

      _interpreter.runForMultipleInputs([tensorImage.buffer], outputs);

      List<double> regression = output0.getDoubleList();
      List<double> classificators = output1.getDoubleList();

      List<Detection> detections = UtilsFace().processCPU(
          options: options,
          rawScores: classificators,
          rawBoxes: regression,
          anchors: _anchors);
    }
  }