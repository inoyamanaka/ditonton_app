import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';

class MockMovieTopRatedEvent extends Fake implements MovieTopRatedEvent {}

class MockMovieTopRatedState extends Fake implements MovieState {}

class MockMovieTopRatedBloc extends MockBloc<MovieEvent, MovieState>
    implements MovieTopRatedBloc {}
