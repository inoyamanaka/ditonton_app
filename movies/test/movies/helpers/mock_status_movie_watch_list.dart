import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';

class MockStatusMovieWatchListEvent extends Fake
    implements StatusWatchListMovieEvent {}

class MockStatusMovieWatchListState extends Fake implements MovieState {}

class MockStatusMovieWatchListBloc extends MockBloc<MovieEvent, MovieState>
    implements MovieStatusWatchListBloc {}
