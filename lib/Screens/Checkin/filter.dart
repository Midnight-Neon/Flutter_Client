import 'detection.dart';

List<Detection> origNms(List<Detection> detections, double threshold) {
    if (detections.length <= 0) return [];
    List<double> x1 = new List();
    List<double> x2 = new List();
    List<double> y1 = new List();
    List<double> y2 = new List();
    List<double> s = new List();

    detections.forEach((detection) {
      x1.add(detection.xMin);
      x2.add(detection.xMin + detection.width);
      y1.add(detection.yMin);
      y2.add(detection.yMin + detection.height);
      s.add(detection.score);
    });

    Array _x1 = new Array(x1);
    Array _x2 = new Array(x2);
    Array _y1 = new Array(y1);
    Array _y2 = new Array(y2);

    Array area = (_x2 - _x1) * (_y2 - _y1);
    List<double> I = _quickSort(s);
    List<int> positions = new List();
    I.forEach((element) {
      positions.add(s.indexOf(element));
    });

    List<int> ind0 = positions.sublist(positions.length - 1, positions.length);
    List<int> ind1 = positions.sublist(0, positions.length - 1);

    List<int> pick = new List();
    while (I.length > 0) {
      Array xx1 = _maximum(_itemIndex(_x1, ind0)[0], _itemIndex(_x1, ind1));
      Array yy1 = _maximum(_itemIndex(_y1, ind0)[0], _itemIndex(_y1, ind1));
      Array xx2 = _maximum(_itemIndex(_x2, ind0)[0], _itemIndex(_x2, ind1));
      Array yy2 = _maximum(_itemIndex(_y2, ind0)[0], _itemIndex(_y2, ind1));
      Array w = _maximum(0.0, xx2 - xx1);
      Array h = _maximum(0.0, yy2 - yy1);
      Array inter = w * h;
      Array o = inter /
          (_sum(_itemIndex(area, ind0)[0], _itemIndex(area, ind1)) - inter);
      pick.add(ind0[0]);
      I = o.where((element) => element <= threshold).toList();
    }
    return [detections[pick[0]]];
  }

  Array _sum(double a, Array b) {
    List<double> _temp = new List();
    b.forEach((element) {
      _temp.add(a + element);
    });
    return new Array(_temp);
  }

  Array _maximum(double value, Array itemIndex) {
    List<double> _temp = new List();
    itemIndex.forEach((element) {
      if (value > element)
        _temp.add(value);
      else
        _temp.add(element);
    });
    return new Array(_temp);
  }

  Array _itemIndex(Array item, List<int> positions) {
    List<double> _temp = new List();
    positions.forEach((element) => _temp.add(item[element]));
    return new Array(_temp);
  }

  List<double> _quickSort(List<double> a) {
    if (a.length <= 1)
      return a;

    var pivot = a[0];
    var less = new List<double>();
    var more = new List<double>();
    var pivotList = new List<double>();

    a.forEach((var i) {
      if (i.compareTo(pivot) < 0) {
        less.add(i);
      } else if (i.compareTo(pivot) > 0) {
        more.add(i);
      } else {
        pivotList.add(i);
      }
    });

    less = _quickSort(less);
    more = _quickSort(more);

    less.addAll(pivotList);
    less.addAll(more);
    return less;
  }