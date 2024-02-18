import 'package:ditonton/common/constants.dart';
import 'package:ditonton/injection.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:ditonton/presentation/widgets/tv_series/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvSeriesSearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/tv-series-search';
  final searchBloc = locator<SearchTvSeriesBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchTvSeriesBloc>(
      create: (context) => searchBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onSubmitted: (query) {
                  searchBloc.add(SearchTvSeriesEvent(query));
                },
                decoration: InputDecoration(
                  hintText: 'Search title',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.search,
              ),
              SizedBox(height: 16),
              Text(
                'Search Result',
                style: kHeading6,
              ),
              BlocBuilder<SearchTvSeriesBloc, TvSeriesState>(
                builder: (context, state) {
                  if (state is SearchTvSeriesLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is SearchTvSeriesFailure) {
                    return Center(
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

                  return SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
