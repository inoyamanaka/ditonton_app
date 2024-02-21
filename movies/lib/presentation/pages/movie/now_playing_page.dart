// ignore_for_file: constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:movies/presentation/widgets/movie/movie_card_list.dart';

class NowPlayingMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/now-play-movie';

  const NowPlayingMoviesPage({super.key});

  @override
  _NowPlayingMoviesPageState createState() => _NowPlayingMoviesPageState();
}

class _NowPlayingMoviesPageState extends State<NowPlayingMoviesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OnTheAirMovieBloc>(context).add(
      const OnTheAirMovieEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<OnTheAirMovieBloc, MovieState>(
            builder: (context, state) {
              if (state is OnTheAirMovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is OnTheAirMovieSuccess) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final series = state.data[index];
                    return MovieCard(series);
                  },
                  itemCount: state.data.length,
                );
              }
              if (state is OnTheAirMovieFailure) {
                return Center(
                  key: const Key('error_message'),
                  child: Text(state.message),
                );
              }
              return const SizedBox();
            },
          )),
    );
  }
}
