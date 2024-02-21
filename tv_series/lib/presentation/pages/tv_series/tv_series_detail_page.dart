// ignore_for_file: constant_identifier_names, library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/common/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tv_series/domain/entities/genre.dart';
import 'package:tv_series/domain/entities/tv_series_detail.dart';
import 'package:tv_series/presentation/bloc/tv_series/tv_series_bloc.dart';

class TvSeriesDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-tv-series';

  final int id;
  const TvSeriesDetailPage({super.key, required this.id});

  @override
  _TvSeriesDetailPageState createState() => _TvSeriesDetailPageState();
}

class _TvSeriesDetailPageState extends State<TvSeriesDetailPage> {
  bool isAddWatchlist = false;

  @override
  void initState() {
    super.initState();
    context.read<DetailTvSeriesBloc>().add(
          DetailTvSeriesEvent(widget.id),
        );
    context.read<RecommendationTvSeriesBloc>().add(
          RecommendationTvSeriesEvent(widget.id),
        );
    context.read<StatusWatchListBloc>().add(
          StatusWatchListTvSeriesEvent(widget.id),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailTvSeriesBloc, TvSeriesState>(
        builder: (context, state) {
          if (state is DetailTvSeriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DetailTvSeriesSuccess) {
            final series = state.data;
            return SafeArea(
              child: DetailContent(series, isAddWatchlist),
            );
          }
          if (state is DetailTvSeriesFailure) {
            return Text(state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class DetailContent extends StatefulWidget {
  final TvSeriesDetail series;
  final bool isAddedWatchlist;

  const DetailContent(this.series, this.isAddedWatchlist, {super.key});

  @override
  State<DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  late ValueNotifier<bool> statusWatchList;

  @override
  void initState() {
    super.initState();
    statusWatchList = ValueNotifier<bool>(widget.isAddedWatchlist);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return MultiBlocListener(
      listeners: [
        BlocListener<StatusWatchListBloc, TvSeriesState>(
          listener: (context, state) {
            if (state is StatusWatchListTvSeriesSuccess) {
              // widget.isAddedWatchlist = state.status;
            }
          },
        ),
        BlocListener<InsertWatchListBloc, TvSeriesState>(
          listener: (context, state) {
            if (state is InsertWatchListTvSeriesSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Berhasil menambahkan ke daftar')));
            }
          },
        ),
        BlocListener<RemoveWatchListBloc, TvSeriesState>(
          listener: (context, state) {
            if (state is RemoveWatchListTvSeriesSuccess) {
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
                'https://image.tmdb.org/t/p/w500//${widget.series.posterPath}',
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
                                key: const Key("title"),
                                widget.series.name!,
                                style: kHeading5,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (!widget.isAddedWatchlist) {
                                    context.read<InsertWatchListBloc>().add(
                                          InsertWatchListTvSeriesEvent(
                                              widget.series),
                                        );
                                    statusWatchList.value = true;
                                  } else {
                                    context.read<RemoveWatchListBloc>().add(
                                          RemoveWatchListTvSeriesEvent(
                                              widget.series),
                                        );
                                    statusWatchList.value = false;
                                  }
                                },
                                child: ValueListenableBuilder(
                                  key: const Key('icon'),
                                  valueListenable: statusWatchList,
                                  builder: (context, value, child) => Row(
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
                                key: const Key("genre"),
                                _showGenres(widget.series.genres!),
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: widget.series.voteAverage! / 2,
                                    itemCount: 5,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: kMikadoYellow,
                                    ),
                                    itemSize: 24,
                                  ),
                                  Text('${widget.series.voteAverage}')
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Eposode : ${widget.series.numberOfEpisodes}',
                                style: kHeading6,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Seasons : ${widget.series.seasons![0].seasonNumber}',
                                style: kHeading6,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Overview',
                                style: kHeading6,
                              ),
                              Text(
                                key: const Key("overView"),
                                widget.series.overview!,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Recommendations',
                                style: kHeading6,
                              ),
                              BlocBuilder<RecommendationTvSeriesBloc,
                                  TvSeriesState>(
                                builder: (context, state) {
                                  if (state is RecommendationTvSeriesLoading) {}
                                  if (state is RecommendationTvSeriesSuccess) {
                                    return SizedBox(
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
                                                  TvSeriesDetailPage.ROUTE_NAME,
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
}
