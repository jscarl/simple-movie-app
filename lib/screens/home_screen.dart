import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movie_bloc.dart';
import 'package:movie_app/screens/movie_detail.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/widgets/movie_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchQuery = TextEditingController();
  late Timer _timer;

  @override
  void initState() {
    BlocProvider.of<MovieBloc>(context)
        .add(FetchMovieList(path: '/movie/popular'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: Container(
            width: double.infinity,
            child: TextFormField(
              controller: _searchQuery,
              style: TextStyle(
                color: Colors.white,
              ),
              autovalidateMode: AutovalidateMode.disabled,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: 'Search movie',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                alignLabelWithHint: false,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                border: InputBorder.none,
              ),
              onChanged: (String val) async {},
              onFieldSubmitted: (String value) {},
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return print('pull refresh');
        },
        child: Container(
          padding: EdgeInsets.all(kDefaultPadding / 2),
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieDataLoaded) {
                return GridView.extent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                  children: List.generate(
                    18,
                    (index) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => MovieDetail(state.movies![index]),
                        ));
                      },
                      child: MovieItem(
                        movie: state.movies![index],
                      ),
                    ),
                  ),
                );
              }
              if (state is MovieDataEmpty) {
                return Center(
                  child: Text(
                    state.message ?? 'Empty',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }

              if (state is MovieDataError) {
                return Center(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.error,
                          size: 50,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          state.errorMessage ?? 'Error!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
