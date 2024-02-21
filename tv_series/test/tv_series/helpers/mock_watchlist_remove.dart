import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/presentation/bloc/tv_series/tv_series_bloc.dart';

class MockWatchlistRemoveEvent extends Fake
    implements RemoveWatchListTvSeriesEvent {}

class MockWatchlisRemoveState extends Fake implements TvSeriesState {}

class MockWatchlistRemoveBloc extends MockBloc<TvSeriesEvent, TvSeriesState>
    implements RemoveWatchListBloc {}
