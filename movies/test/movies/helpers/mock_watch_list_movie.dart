import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';

class MockWatchListMovieEvent extends Fake implements GetWatchListMovieEvent {}

class MockWatchListMovieState extends Fake implements MovieState {}

class MockWatchListMovieBloc extends MockBloc<MovieEvent, MovieState>
    implements GetWatchListMovieBloc {}
