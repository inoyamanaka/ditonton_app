import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:tv_series/presentation/pages/tv_series/on_the_air_tv_series.dart';
import 'package:tv_series/presentation/pages/tv_series/popular_tv_series_page.dart';
import 'package:tv_series/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:tv_series/presentation/pages/tv_series/tv_series_top_rated_page.dart';

class TvSeriesHomePage extends StatefulWidget {
  const TvSeriesHomePage({super.key});

  @override
  State<TvSeriesHomePage> createState() => _TvSeriesHomePageState();
}

class _TvSeriesHomePageState extends State<TvSeriesHomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSubHeading(
              title: 'On The Air',
              onTap: () =>
                  Navigator.pushNamed(context, OnTheAirTvSeriesPage.ROUTE_NAME),
            ),
            BlocBuilder<OnTheAirTvSeriesBloc, TvSeriesState>(
                builder: (context, state) {
              if (state is OnTheAirTvSeriesSuccess) {
                return TvSeriesList(state.data);
              }
              return const SizedBox();
            }),
            _buildSubHeading(
              title: 'Popular',
              onTap: () =>
                  Navigator.pushNamed(context, PopularTvSeriesPage.ROUTE_NAME),
            ),
            BlocBuilder<PopularTvSeriesBloc, TvSeriesState>(
                builder: (context, state) {
              if (state is PopularTvSeriesSuccess) {
                return TvSeriesList(state.data);
              }
              return const SizedBox();
            }),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () =>
                  Navigator.pushNamed(context, TvSeriesTopRatedPage.ROUTE_NAME),
            ),
            BlocBuilder<TvSeriesTopRatedBloc, TvSeriesState>(
                builder: (context, state) {
              if (state is TvSeriesTopRatedSuccess) {
                return TvSeriesList(state.data);
              }
              return const SizedBox();
            }),
          ],
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvSeriesList extends StatelessWidget {
  final List<TvSeries> tvSeries;

  const TvSeriesList(this.tvSeries, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final series = tvSeries[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvSeriesDetailPage.ROUTE_NAME,
                  arguments: series.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${series.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeries.length,
      ),
    );
  }
}
