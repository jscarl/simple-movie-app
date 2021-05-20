import 'package:flutter/material.dart';
import 'package:movie_app/widgets/image_network.dart';

class PosterImage extends StatelessWidget {
  static const POSTER_RATIO = 0.7;

  PosterImage(
    this.posterUrl, {
    this.height = 100.0,
  });

  final String posterUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(4.0),
      elevation: 2.0,
      child: ImageNetwork(
        posterUrl,
        width: POSTER_RATIO * height,
      ),
    );
  }
}
