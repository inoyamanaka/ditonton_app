// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names, library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/domain/entities/genre.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';

class MovieDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail';

  final int id;
  const MovieDetailPage({super.key, required this.id});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  // bool isAddWatchlist = false;

  @override
  void initState() {
    super.initState();
    context.read<DetailMovieBloc>().add(
          DetailMovieEvent(widget.id),
        );
    context.read<RecommendationMovieBloc>().add(
          RecommendationMovieEvent(widget.id),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailMovieBloc, MovieState>(
        builder: (context, state) {
          if (state is DetailMovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DetailMovieSuccess) {
            final movie = state.data;
            return SafeArea(
                child: DetailContent(
              movie: movie,
              id: widget.id,
              // isAddedWatchlist: isAddWatchlist,
            ));
          }
          if (state is DetailMovieFailure) {
            return Text(state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class DetailContent extends StatefulWidget {
  final MovieDetail movie;
  final int id;

  const DetailContent({
    super.key,
    required this.movie,
    required this.id,
    // required this.isAddedWatchlist,
  });

  @override
  State<DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  late ValueNotifier<bool> statusWatchList;

  @override
  void initState() {
    super.initState();
    statusWatchList = ValueNotifier<bool>(false);
    context.read<MovieStatusWatchListBloc>().add(
          StatusWatchListMovieEvent(widget.id),
        );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return MultiBlocListener(
      listeners: [
        BlocListener<MovieStatusWatchListBloc, MovieState>(
          listener: (context, state) {
            if (state is StatusWatchListMovieSuccess) {
              statusWatchList.value = state.status;
            }
          },
        ),
        BlocListener<InsertWatchListMovieBloc, MovieState>(
          listener: (context, state) {
            if (state is InsertWatchListMovieSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Berhasil menambahkan ke daftar')));
            }
          },
        ),
        BlocListener<RemoveWatchListMovieBloc, MovieState>(
          listener: (context, state) {
            if (state is RemoveWatchListMovieSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Berhasil menghapus dari daftar')));
            }
          },
        ),
      ],
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://image.tmdb.org/t/p/w500//${widget.movie.posterPath}',
            width: screenWidth,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Container(
            margin: const EdgeInsets.only(top: 48 + 8),
            child: DraggableScrollableSheet(
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: kRichBlack,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 16,
                    right: 16,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                key: const Key('Title'),
                                widget.movie.title,
                                style: kHeading5,
                              ),
                              ValueListenableBuilder(
                                valueListenable: statusWatchList,
                                builder: (context, value, child) =>
                                    ElevatedButton(
                                  onPressed: () async {
                                    if (statusWatchList.value) {
                                      BlocProvider.of<RemoveWatchListMovieBloc>(
                                              context)
                                          .add(
                                        RemoveWatchListMovieEvent(widget.movie),
                                      );
                                      statusWatchList.value = false;
                                    } else {
                                      BlocProvider.of<InsertWatchListMovieBloc>(
                                              context)
                                          .add(
                                        InsertWatchListMovieEvent(widget.movie),
                                      );
                                      statusWatchList.value = true;
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      statusWatchList.value
                                          ? const Icon(Icons.check)
                                          : const Icon(Icons.add),
                                      const Text('Watchlist'),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                key: const Key('Genre'),
                                _showGenres(widget.movie.genres),
                              ),
                              Text(
                                _showDuration(widget.movie.runtime),
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: widget.movie.voteAverage / 2,
                                    itemCount: 5,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: kMikadoYellow,
                                    ),
                                    itemSize: 24,
                                  ),
                                  Text('${widget.movie.voteAverage}')
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Overview',
                                style: kHeading6,
                              ),
                              Text(
                                key: const Key('OverView'),
                                widget.movie.overview,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Recommendations',
                                style: kHeading6,
                              ),
                              BlocBuilder<RecommendationMovieBloc, MovieState>(
                                builder: (context, state) {
                                  if (state is RecommendationMovieLoading) {}
                                  if (state is RecommendationMovieSuccess) {
                                    return SizedBox(
                                      key: const Key('Recommend Movie'),
                                      height: 150,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          final series = state.data[index];
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pushReplacementNamed(
                                                  context,
                                                  MovieDetailPage.ROUTE_NAME,
                                                  arguments: series.id,
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      'https://image.tmdb.org/t/p/w500${series.posterPath}',
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount: state.data.length,
                                      ),
                                    );
                                  }
                                  return const SizedBox();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          color: Colors.white,
                          height: 4,
                          width: 48,
                        ),
                      ),
                    ],
                  ),
                );
              },
              // initialChildSize: 0.5,
              minChildSize: 0.25,
              // maxChildSize: 1.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: kRichBlack,
              foregroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
