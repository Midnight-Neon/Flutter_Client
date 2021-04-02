import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markdown/markdown.dart' as m;
import '../config/style_config.dart';

///Tag: LatexBlock
class LatexBlock {
  LatexBlock._internal();

  static LatexBlock _instance;

  factory LatexBlock() {
    _instance ??= LatexBlock._internal();
    return _instance;
  }
  final config = StyleConfig()?.imgConfig;

  ///the SVGImage widget
  Widget getLatexBlockWidget(m.Element node) {
    return SvgPicture.network(
      Uri.encodeFull(node.attributes['src']),
      width: 18,
    );
  }

  InlineSpan getLatexBlockSpan(m.Element node) {
    Widget image = SvgPicture.network(
      Uri.encodeFull(node.attributes['src']),
      width: 18,
    );

    return WidgetSpan(child: config?.imgWrapper?.call(image) ?? image);
  }
}

InlineSpan getLatexBlockSpan(m.Element node) {
  Widget image = SvgPicture.network(
    Uri.encodeFull(node.attributes['src']),
    height: 16,
  );

  return WidgetSpan(child: image);
}
