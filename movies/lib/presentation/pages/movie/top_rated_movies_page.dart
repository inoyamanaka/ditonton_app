// ignore_for_file: constant_identifier_names, library_private_types_in_public_api


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:movies/presentation/widgets/movie/movie_card_list.dart';

class TopRatedMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-movie';

  const TopRatedMoviesPage({super.key});

  @override
  _TopRatedMoviesPageState createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends State<TopRatedMoviesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieTopRatedBloc>(context).add(
      const MovieTopRatedEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<MovieTopRatedBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieTopRatedLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MovieTopRatedSuccess) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final series = state.data[index];
                    return MovieCard(series);
                  },
                  itemCount: state.data.length,
                );
              }
              if (state is MovieTopRatedFailure) {
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
