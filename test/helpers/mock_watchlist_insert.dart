import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockWatchlistInsertEvent extends Fake
    implements InsertWatchListTvSeriesEvent {}

class MockWatchlistInsertState extends Fake implements TvSeriesState {}

class MockWatchlistInsertBloc extends MockBloc<TvSeriesEvent, TvSeriesState>
    implements InsertWatchListBloc {}
