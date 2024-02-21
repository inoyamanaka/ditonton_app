import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';

class MockMovieDetailEvent extends Fake implements DetailMovieEvent {}

class MockMovieDetailState extends Fake implements MovieState {}

class MockMovieDetailBloc extends MockBloc<MovieEvent, MovieState>
    implements DetailMovieBloc {}
