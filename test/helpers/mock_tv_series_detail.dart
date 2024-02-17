import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockTvSeriesDetailEvent extends Fake implements DetailTvSeriesEvent {}

class MockTvSeriesDetailState extends Fake implements TvSeriesState {}

class MockTvSeriesDetailBloc extends MockBloc<TvSeriesEvent, TvSeriesState>
    implements DetailTvSeriesBloc {}
