import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';

class MockWatchlistMovieRemoveEvent extends Fake
    implements RemoveWatchListMovieEvent {}

class MockWatchlistMovieRemoveState extends Fake implements MovieState {}

class MockWatchlistRemoveMovieBloc extends MockBloc<MovieEvent, MovieState>
    implements RemoveWatchListMovieBloc {}
