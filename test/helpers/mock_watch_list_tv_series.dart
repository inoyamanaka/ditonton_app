import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockWatchListEvent extends Fake implements GetWatchListTvSeriesEvent {}

class MockWatchListState extends Fake implements TvSeriesState {}

class MockWatchListBloc extends MockBloc<TvSeriesEvent, TvSeriesState>
    implements GetWatchListBloc {}
