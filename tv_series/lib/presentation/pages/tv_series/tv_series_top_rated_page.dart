// ignore_for_file: library_private_types_in_public_api, constant_identifier_names


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_series/tv_series_card_list.dart';

class TvSeriesTopRatedPage extends StatefulWidget {
  static const ROUTE_NAME = '/toprated-tv-series';

  const TvSeriesTopRatedPage({super.key});

  @override
  _TvSeriesTopRatedPageState createState() => _TvSeriesTopRatedPageState();
}

class _TvSeriesTopRatedPageState extends State<TvSeriesTopRatedPage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TvSeriesTopRatedBloc>(context).add(
      const TvSeriesTopRatedEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Tv Series'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TvSeriesTopRatedBloc, TvSeriesState>(
            builder: (context, state) {
              if (state is TvSeriesTopRatedLoading) {
                return const Center(
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
