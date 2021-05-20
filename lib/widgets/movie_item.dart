import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_response.dart';
import 'package:movie_app/widgets/image_network.dart';

class MovieItem extends StatelessWidget {
  MovieItem({
    Key? key,
    this.movie,
  }) : super(key: key);
  final Result? movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageNetwork(
          movie!.getPosterImage('185'),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.grey.shade200.withOpacity(0.4),
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie?.title ?? '',
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
