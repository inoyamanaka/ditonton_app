import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockStatusWatchListEvent extends Fake
    implements StatusWatchListTvSeriesEvent {}

class MockStatusWatchListState extends Fake implements TvSeriesState {}

class MockWatchListStatusBloc extends MockBloc<TvSeriesEvent, TvSeriesState>
    implements StatusWatchListBloc {}
