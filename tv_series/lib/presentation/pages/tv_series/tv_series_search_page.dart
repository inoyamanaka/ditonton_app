// ignore_for_file: constant_identifier_names

import 'package:core/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_series/tv_series_card_list.dart';

class TvSeriesSearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/tv-series-search';

  const TvSeriesSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                BlocProvider.of<SearchTvSeriesBloc>(context)
                    .add(SearchTvSeriesEvent(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            BlocBuilder<SearchTvSeriesBloc, TvSeriesState>(
              builder: (context, state) {
                if (state is SearchTvSeriesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is SearchTvSeriesFailure) {
                  return const Center(
                    child: Text('Tv Series not found'),
                  );
                }
                if (state is SearchTvSeriesSuccess) {
                  final result = state.data;
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final series = result[index];
                        return TvSeriesCard(series);
                      },
                      itemCount: result.length,
                    ),
                  );
                }

                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
