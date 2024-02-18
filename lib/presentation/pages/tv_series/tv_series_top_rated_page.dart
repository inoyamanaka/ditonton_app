import 'package:ditonton/injection.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:ditonton/presentation/widgets/tv_series/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvSeriesTopRatedPage extends StatefulWidget {
  static const ROUTE_NAME = '/toprated-tv-series';

  @override
  _TvSeriesTopRatedPageState createState() => _TvSeriesTopRatedPageState();
}

class _TvSeriesTopRatedPageState extends State<TvSeriesTopRatedPage> {
  final topRatedBloc = locator<TvSeriesTopRatedBloc>();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TvSeriesTopRatedBloc>(context).add(
      TvSeriesTopRatedEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated Tv Series'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TvSeriesTopRatedBloc, TvSeriesState>(
            builder: (context, state) {
              if (state is TvSeriesTopRatedLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TvSeriesTopRatedSuccess) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final series = state.data[index];
                    return TvSeriesCard(series);
                  },
                  itemCount: state.data.length,
                );
              }
              if (state is TvSeriesTopRatedFailure) {
                return Center(
                  key: Key('error_message'),
                  child: Text(state.message),
                );
              }
              return SizedBox();
            },
          )),
    );
  }
}
