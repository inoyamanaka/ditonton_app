import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/repositories/movie_repository.dart';


class GetWatchlistMovies {
  final MovieRepository _repository;

  GetWatchlistMovies(this._repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _repository.getWatchlistMovies();
  }
}
