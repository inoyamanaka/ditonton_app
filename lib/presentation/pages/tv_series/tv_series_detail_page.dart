import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/injection.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TvSeriesDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-tv-series';

  final int id;
  TvSeriesDetailPage({required this.id});

  @override
  _TvSeriesDetailPageState createState() => _TvSeriesDetailPageState();
}

class _TvSeriesDetailPageState extends State<TvSeriesDetailPage> {
  final recommendationBloc = locator<RecommendationTvSeriesBloc>();
  final statusWatchListBloc = locator<StatusWatchListBloc>();
  final insertWatchListBloc = locator<InsertWatchListBloc>();
  final removeWatchListBloc = locator<RemoveWatchListBloc>();

  bool isAddWatchlist = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailTvSeriesBloc>(context).add(
      DetailTvSeriesEvent(widget.id),
    );
    recommendationBloc.add(
      RecommendationTvSeriesEvent(widget.id),
    );
    statusWatchListBloc.add(
      StatusWatchListTvSeriesEvent(widget.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecommendationTvSeriesBloc>(
          create: (context) => recommendationBloc,
        ),
        BlocProvider(
          create: (context) => statusWatchListBloc,
        ),
        BlocProvider(
          create: (context) => insertWatchListBloc,
        ),
        BlocProvider(
          create: (context) => removeWatchListBloc,
        ),
      ],
      child: Scaffold(
        body: MultiBlocListener(
          listeners: [
            BlocListener<StatusWatchListBloc, TvSeriesState>(
              listener: (context, state) {
                if (state is StatusWatchListTvSeriesSuccess) {
                  isAddWatchlist = state.status;
                }
              },
            ),
            BlocListener<InsertWatchListBloc, TvSeriesState>(
              listener: (context, state) {
                if (state is InsertWatchListTvSeriesSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Berhasil menambahkan ke daftar')));
                }
              },
            ),
            BlocListener<RemoveWatchListBloc, TvSeriesState>(
              listener: (context, state) {
                if (state is RemoveWatchListTvSeriesSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Berhasil menghapus dari daftar')));
                }
              },
            ),
          ],
          child: BlocBuilder<DetailTvSeriesBloc, TvSeriesState>(
            builder: (context, state) {
              if (state is DetailTvSeriesLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is DetailTvSeriesSuccess) {
                final series = state.data;
                return SafeArea(
                  child: DetailContent(series, isAddWatchlist,
                      insertWatchListBloc, removeWatchListBloc),
                );
              }
              if (state is DetailTvSeriesFailure) {
                return Text(state.message);
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class DetailContent extends StatefulWidget {
  final TvSeriesDetail series;
  final InsertWatchListBloc insertWatchListBloc;
  final RemoveWatchListBloc removeWatchListBloc;

  final bool isAddedWatchlist;

  DetailContent(this.series, this.isAddedWatchlist, this.insertWatchListBloc,
      this.removeWatchListBloc);

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
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://image.tmdb.org/t/p/w500${widget.series.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
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
                              widget.series.name!,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (!widget.isAddedWatchlist) {
                                  widget.insertWatchListBloc.add(
                                    InsertWatchListTvSeriesEvent(widget.series),
                                  );

                                  statusWatchList.value = true;
                                } else {
                                  widget.removeWatchListBloc.add(
                                    RemoveWatchListTvSeriesEvent(widget.series),
                                  );
                                  statusWatchList.value = false;
                                }
                              },
                              child: ValueListenableBuilder(
                                valueListenable: statusWatchList,
                                builder: (context, value, child) => Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    statusWatchList.value
                                        ? Icon(Icons.check)
                                        : Icon(Icons.add),
                                    Text('Watchlist'),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              _showGenres(widget.series.genres!),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: widget.series.voteAverage! / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${widget.series.voteAverage}')
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Eposode : ${widget.series.numberOfEpisodes}',
                              style: kHeading6,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Seasons : ${widget.series.seasons![0].seasonNumber}',
                              style: kHeading6,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              widget.series.overview!,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<RecommendationTvSeriesBloc,
                                TvSeriesState>(
                              builder: (context, state) {
                                if (state is RecommendationTvSeriesLoading) {}
                                if (state is RecommendationTvSeriesSuccess) {
                                  return Container(
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
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${series.posterPath}',
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: state.data.length,
                                    ),
                                  );
                                }
                                return SizedBox();
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
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<GenreTv> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name! + ', ';
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
