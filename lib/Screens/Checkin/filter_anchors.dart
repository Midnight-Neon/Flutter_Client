import 'anchors.dart';

List<Anchor> getAnchors(AnchorOption options) {
    List<Anchor> _anchors = new List();
    if (options.stridesSize != options.numLayers) {
      print('strides_size and num_layers must be equal.');
      return [];
    }
    int layerID = 0;
    while (layerID < options.stridesSize) {
      List<double> anchorHeight = new List();
      List<double> anchorWidth = new List();
      List<double> aspectRatios = new List();
      List<double> scales = new List();

      int lastSameStrideLayer = layerID;
      while (lastSameStrideLayer < options.stridesSize &&
          options.strides[lastSameStrideLayer] == options.strides[layerID]) {
        double scale = options.minScale +
            (options.maxScale - options.minScale) *
                1.0 *
                lastSameStrideLayer /
                (options.stridesSize - 1.0);
        if (lastSameStrideLayer == 0 && options.reduceBoxesInLowestLayer) {
          aspectRatios.add(1.0);
          aspectRatios.add(2.0);
          aspectRatios.add(0.5);
          scales.add(0.1);
          scales.add(scale);
          scales.add(scale);
        } else {
          for (int i = 0; i < options.aspectRatios.length; i++) {
            aspectRatios.add(options.aspectRatios[i]);
            scales.add(scale);
          }

          if (options.interpolatedScaleAspectRatio > 0.0) {
            double scaleNext = 0.0;
            if (lastSameStrideLayer == options.stridesSize - 1) {
              scaleNext = 1.0;
            } else {
              scaleNext = options.minScale +
                  (options.maxScale - options.minScale) *
                      1.0 *
                      (lastSameStrideLayer + 1) /
                      (options.stridesSize - 1.0);
            }
            scales.add(sqrt(scale * scaleNext));
            aspectRatios.add(options.interpolatedScaleAspectRatio);
          }
        }
        lastSameStrideLayer++;
      }
      for (int i = 0; i < aspectRatios.length; i++) {
        double ratioSQRT = sqrt(aspectRatios[i]);
        anchorHeight.add(scales[i] / ratioSQRT);
        anchorWidth.add(scales[i] * ratioSQRT);
      }
      int featureMapHeight = 0;
      int featureMapWidth = 0;
      if (options.featureMapHeightSize > 0) {
        featureMapHeight = options.featureMapHeight[layerID];
        featureMapWidth = options.featureMapWidth[layerID];
      } else {
        int stride = options.strides[layerID];
        featureMapHeight = (1.0 * options.inputSizeHeight / stride).ceil();
        featureMapWidth = (1.0 * options.inputSizeWidth / stride).ceil();
      }

      for (int y = 0; y < featureMapHeight; y++) {
        for (int x = 0; x < featureMapWidth; x++) {
          for (int anchorID = 0; anchorID < anchorHeight.length; anchorID++) {
            double xCenter =
                (x + options.anchorOffsetX) * 1.0 / featureMapWidth;
            double yCenter =
                (y + options.anchorOffsetY) * 1.0 / featureMapHeight;
            double w = 0;
            double h = 0;
            if (options.fixedAnchorSize) {
              w = 1.0;
              h = 1.0;
            } else {
              w = anchorWidth[anchorID];
              h = anchorHeight[anchorID];
            }
            _anchors.add(Anchor(xCenter, yCenter, h, w));
          }
        }
      }
      layerID = lastSameStrideLayer;
    }
    return _anchors;
  }