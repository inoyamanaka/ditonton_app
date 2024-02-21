// ignore_for_file: constant_identifier_names, library_private_types_in_public_api

import 'package:core/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:movies/presentation/widgets/movie/movie_card_list.dart';

class WatchlistMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-movie';

  const WatchlistMoviesPage({super.key});

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware {

  List<Movie> dataMovie = [];

  @override
  void initState() {
    super.initState();
     BlocProvider.of<GetWatchListMovieBloc>(context).add(const GetWatchListMovieEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
      BlocProvider.of<GetWatchListMovieBloc>(context).add(const GetWatchListMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<GetWatchListMovieBloc, MovieState>(
            builder: (context, state) {
              if (state is GetWatchListMovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetWatchListMovieFailure) {
                return Center(
                  key: const Key('error_message'),
                  child: Text(state.message),
                );
              } else if (state is GetWatchListMovieSuccess) {
                dataMovie = state.data;
                ListView.builder(
                  itemBuilder: (context, index) {
                    final series = state.data[index];
                    return MovieCard(series);
                  },
                  itemCount: state.data.length,
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  final series = dataMovie[index];
                  return MovieCard(series);
                },
                itemCount: dataMovie.length,
              );
            },
          )),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
