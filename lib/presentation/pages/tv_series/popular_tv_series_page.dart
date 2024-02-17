import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:ditonton/presentation/widgets/tv_series/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-tv-series';

  @override
  _PopularTvSeriesPageState createState() => _PopularTvSeriesPageState();
}

class _PopularTvSeriesPageState extends State<PopularTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PopularTvSeriesBloc>(context).add(
      PopularTvSeriesEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Tv Series'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<PopularTvSeriesBloc, TvSeriesState>(
            builder: (context, state) {
              if (state is PopularTvSeriesLoading) {
                return Center(
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
