import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String imageUrl;
  final double? width;

  const ImageNetwork(
    this.imageUrl, {
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        width: width ?? double.infinity,
        placeholder: (BuildContext context, String url) => _circleIndicator(),
        errorWidget: (BuildContext context, String url, error) =>
            Icon(Icons.error),
      ),
    );
  }

  Widget _circleIndicator() {
    return Center(
      child: Container(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
