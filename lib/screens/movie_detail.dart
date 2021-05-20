import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_response.dart';
import 'package:movie_app/widgets/movie_detail_header.dart';

class MovieDetail extends StatelessWidget {
  MovieDetail(this.movie);

  final Result movie;

  final String storyLine =
      'Curabitur id scelerisque ligula. Donec ultricies consectetur egestas. Nulla consectetur, est vitae vehicula auctor, ipsum diam maximus nisi, iaculis tempus diam eros ac nibh. Mauris hendrerit faucibus ipsum nec gravida. Vivamus sed augue dapibus tortor luctus tristique nec non justo. Quisque sapien justo, vestibulum id tellus eget, sollicitudin lobortis sem. Suspendisse quis congue libero. Aliquam eu nulla nisi. Aliquam vestibulum volutpat dolor nec pellentesque. Phasellus dui lorem, gravida quis suscipit in, pharetra commodo urna. Pellentesque dignissim tincidunt augue sit amet pulvinar. Donec non imperdiet tellus. Curabitur sit amet est elit.';
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieDetailHeader(movie),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Story line',
                    style: textTheme.subtitle1?.copyWith(fontSize: 18.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    movie.overview ?? storyLine,
                    style: textTheme.bodyText1?.copyWith(
                      color: Colors.black45,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
