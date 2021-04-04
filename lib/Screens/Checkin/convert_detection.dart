import 'detection.dart';

Detection convertToDetection(double boxYMin, double boxXMin, double boxYMax,
      double boxXMax, double score, int classID, bool flipVertically) {
    double _yMin;
    if (flipVertically)
      _yMin = 1.0 - boxYMax;
    else
      _yMin = boxYMin;
    return new Detection(score, classID, boxXMin, _yMin, (boxXMax - boxXMin),
        (boxXMax - boxYMin));
  }