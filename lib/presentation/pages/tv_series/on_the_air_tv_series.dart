import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:ditonton/presentation/widgets/tv_series/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnTheAirTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/onair-tv-series';

  @override
  _OnTheAirTvSeriesPageState createState() => _OnTheAirTvSeriesPageState();
}

class _OnTheAirTvSeriesPageState extends State<OnTheAirTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OnTheAirTvSeriesBloc>(context).add(
      OnTheAirTvSeriesEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('On The Air Tv Series'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<OnTheAirTvSeriesBloc, TvSeriesState>(
            builder: (context, state) {
              if (state is OnTheAirTvSeriesLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is OnTheAirTvSeriesSuccess) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final series = state.data[index];
                    return TvSeriesCard(series);
                  },
                  itemCount: state.data.length,
                );
              }
              if (state is OnTheAirTvSeriesFailure) {
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
