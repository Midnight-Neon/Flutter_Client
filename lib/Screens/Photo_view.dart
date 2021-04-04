import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoPreview extends StatelessWidget {
  final ImageProvider  imageProvider;
  final LoadingBuilder  loadingBuilder;
  final BoxDecoration  backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final dynamic initialScale;
  final Alignment basePosition;
  final FilterQuality filterQuality;
  final bool  disableGestures;
  final ImageErrorWidgetBuilder errorBuilder;

  const PhotoPreview({Key key, this.imageProvider, this.loadingBuilder, this.backgroundDecoration, this.minScale, this.maxScale, this.initialScale, this.basePosition, this.filterQuality, this.disableGestures, this.errorBuilder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
    ), child: GestureDetector(onTapDown:(_) {
          Navigator.pop(context);
        },child:PhotoView(
          imageProvider: imageProvider,
          loadingBuilder: loadingBuilder,
          backgroundDecoration: backgroundDecoration,
          minScale: minScale,
          maxScale: maxScale,
          initialScale: initialScale,
          basePosition: basePosition,
          filterQuality: filterQuality,
          disableGestures: disableGestures,
          errorBuilder: errorBuilder,
        ),),));
  }
}
