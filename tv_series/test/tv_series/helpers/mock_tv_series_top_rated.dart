import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/presentation/bloc/tv_series/tv_series_bloc.dart';

class MockTvSeriesTopRatedEvent extends Fake implements TvSeriesTopRatedEvent {}

class MockTvSeriesTopRatedState extends Fake implements TvSeriesState {}

class MockTvSeriesTopRatedBloc extends MockBloc<TvSeriesEvent, TvSeriesState>
    implements TvSeriesTopRatedBloc {}
