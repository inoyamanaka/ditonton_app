// ignore_for_file: library_private_types_in_public_api, constant_identifier_names


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:movies/presentation/widgets/movie/movie_card_list.dart';

class PopularMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-movie';

  const PopularMoviesPage({super.key});

  @override
  _PopularMoviesPageState createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PopularMovieBloc>(context).add(
      const PopularMovieEvent(),
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
          child: BlocBuilder<PopularMovieBloc, MovieState>(
            builder: (context, state) {
              if (state is PopularMovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } if (state is PopularMovieSuccess) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final series = state.data[index];
                    return MovieCard(series);
                  },
                  itemCount: state.data.length,
                );
              }
              if (state is PopularMovieFailure) {
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
