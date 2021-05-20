import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movie_bloc.dart';
import 'package:movie_app/screens/home_screen.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple - Movie Application',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MovieBloc>(create: (context) => MovieBloc()),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
