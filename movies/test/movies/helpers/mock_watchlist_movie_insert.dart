import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';

class MockWatchlistMovieInsertEvent extends Fake
    implements InsertWatchListMovieEvent {}

class MockWatchlistInsertMovieState extends Fake implements MovieState {}

class MockWatchlistInsertMovieBloc extends MockBloc<MovieEvent, MovieState>
    implements InsertWatchListMovieBloc {}
