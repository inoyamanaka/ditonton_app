import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';

class MockMovieRecommendationEvent extends Fake
    implements RecommendationMovieEvent {}

class MockMovieRecommendationState extends Fake implements MovieState {}

class MockMovieRecommendationBloc extends MockBloc<MovieEvent, MovieState>
    implements RecommendationMovieBloc {}
