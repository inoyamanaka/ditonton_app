import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockTvSeriesRecommendationEvent extends Fake
    implements RecommendationTvSeriesEvent {}

class MockTvSeriesRecommendationState extends Fake implements TvSeriesState {}

class MockTvSeriesRecommendationBloc
    extends MockBloc<TvSeriesEvent, TvSeriesState>
    implements RecommendationTvSeriesBloc {}
