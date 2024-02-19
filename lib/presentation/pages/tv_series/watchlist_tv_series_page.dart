import 'package:ditonton/common/utils.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/injection.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:ditonton/presentation/widgets/tv_series/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-tv-series';

  @override
  _WatchlistTvSeriesPageState createState() => _WatchlistTvSeriesPageState();
}

class _WatchlistTvSeriesPageState extends State<WatchlistTvSeriesPage>
    with RouteAware {
  final watchListBloc = locator<GetWatchListBloc>();
  List<TvSeries> dataTvSeries = [];

  @override
  void initState() {
    super.initState();
    watchListBloc.add(GetWatchListTvSeriesEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    watchListBloc.add(GetWatchListTvSeriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetWatchListBloc>(
      create: (context) => watchListBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Watchlist'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<GetWatchListBloc, TvSeriesState>(
              builder: (context, state) {
                if (state is GetWatchListTvSeriesLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is GetWatchListTvSeriesFailure) {
                  return Center(
                    key: Key('error_message'),
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
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
