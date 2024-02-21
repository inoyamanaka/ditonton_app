import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';

class MockMoviePopularEvent extends Fake implements PopularMovieEvent {}

class MockMoviePopularState extends Fake implements MovieState {}

class MockMoviePopularBloc extends MockBloc<MovieEvent, MovieState>
    implements PopularMovieBloc {}
