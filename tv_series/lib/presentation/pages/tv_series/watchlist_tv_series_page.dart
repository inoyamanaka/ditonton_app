// ignore_for_file: constant_identifier_names, library_private_types_in_public_api

import 'package:core/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_series/tv_series_card_list.dart';

class WatchlistTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-tv-series';

  const WatchlistTvSeriesPage({super.key});

  @override
  _WatchlistTvSeriesPageState createState() => _WatchlistTvSeriesPageState();
}

class _WatchlistTvSeriesPageState extends State<WatchlistTvSeriesPage>
    with RouteAware {
  // final watchListBloc = locator<GetWatchListBloc>();
  List<TvSeries> dataTvSeries = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetWatchListBloc>(context)
        .add(const GetWatchListTvSeriesEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    BlocProvider.of<GetWatchListBloc>(context)
        .add(const GetWatchListTvSeriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<GetWatchListBloc, TvSeriesState>(
            builder: (context, state) {
              if (state is GetWatchListTvSeriesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetWatchListTvSeriesFailure) {
                return Center(
                  key: const Key('error_message'),
                  child: Text(state.message),
                );
              } else if (state is GetWatchListTvSeriesSuccess) {
                dataTvSeries = state.data;
                ListView.builder(
                  itemBuilder: (context, index) {
                    final series = state.data[index];
                    return TvSeriesCard(series);
                  },
                  itemCount: state.data.length,
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  final series = dataTvSeries[index];
                  return TvSeriesCard(series);
                },
                itemCount: dataTvSeries.length,
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
