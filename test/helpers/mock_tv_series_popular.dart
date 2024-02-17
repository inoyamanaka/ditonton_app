import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockTvSeriesPopularEvent extends Fake implements PopularTvSeriesEvent {}

class MockTvSeriesPopularState extends Fake implements TvSeriesState {}

class MockTvSeriesPopularBloc extends MockBloc<TvSeriesEvent, TvSeriesState>
    implements PopularTvSeriesBloc {}
