// ignore_for_file: constant_identifier_names, library_private_types_in_public_api


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_series/tv_series_card_list.dart';

class PopularTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-tv-series';

  const PopularTvSeriesPage({super.key});

  @override
  _PopularTvSeriesPageState createState() => _PopularTvSeriesPageState();
}

class _PopularTvSeriesPageState extends State<PopularTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PopularTvSeriesBloc>(context).add(
      const PopularTvSeriesEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Tv Series'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<PopularTvSeriesBloc, TvSeriesState>(
            builder: (context, state) {
              if (state is PopularTvSeriesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PopularTvSeriesSuccess) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final series = state.data[index];
                    return TvSeriesCard(series);
                  },
                  itemCount: state.data.length,
                );
              }
              if (state is PopularTvSeriesFailure) {
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
