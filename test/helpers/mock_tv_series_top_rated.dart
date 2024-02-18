import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockTvSeriesTopRatedEvent extends Fake implements TvSeriesTopRatedEvent {}

class MockTvSeriesTopRatedState extends Fake implements TvSeriesState {}

class MockTvSeriesTopRatedBloc extends MockBloc<TvSeriesEvent, TvSeriesState>
    implements TvSeriesTopRatedBloc {}
