// ignore_for_file: constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_series/tv_series_card_list.dart';

class OnTheAirTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/onair-tv-series';

  const OnTheAirTvSeriesPage({super.key});

  @override
  _OnTheAirTvSeriesPageState createState() => _OnTheAirTvSeriesPageState();
}

class _OnTheAirTvSeriesPageState extends State<OnTheAirTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OnTheAirTvSeriesBloc>(context).add(
      const OnTheAirTvSeriesEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On The Air Tv Series'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<OnTheAirTvSeriesBloc, TvSeriesState>(
            builder: (context, state) {
              if (state is OnTheAirTvSeriesLoading) {
                return const Center(
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
