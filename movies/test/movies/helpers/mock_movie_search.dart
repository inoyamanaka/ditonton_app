import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';

class MockSearchMovieEvent extends Fake implements SearchMovieEvent {}

class MockSearchMovieState extends Fake implements MovieState {}

class MockSearchMovieBloc extends MockBloc<MovieEvent, MovieState>
    implements SearchMovieBloc {}
