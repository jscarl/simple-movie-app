import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_response.dart';
import 'package:movie_app/widgets/banner_image.dart';
import 'package:movie_app/widgets/poster_image.dart';
import 'package:movie_app/widgets/rating_widget.dart';

class MovieDetailHeader extends StatelessWidget {
  MovieDetailHeader(this.movie);
  final Result movie;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final Widget movieInformation = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title ?? '',
          // 'Mortal Kombat',
          style: textTheme.subtitle1,
        ),
        SizedBox(height: 8.0),
        RatingWidget(movie),
        SizedBox(height: 12.0),
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: BannerImage(
            // 'https://image.tmdb.org/t/p/w500/6ELCZlTA5lGUops70hKdB83WJxH.jpg',
            movie.getCoverImage('500'),
          ),
        ),
        Positioned.fill(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              PosterImage(
                // 'https://image.tmdb.org/t/p/w185/nkayOAUBUu4mMvyNf9iHSUiPjF1.jpg',
                movie.getPosterImage('185'),
                height: 180,
              ),
              SizedBox(width: 16.0),
              Expanded(child: movieInformation),
            ],
          ),
        ),
      ],
    );
  }
}
