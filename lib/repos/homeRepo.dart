import 'package:bookly_app/errors/failure.dart';
import 'package:bookly_app/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepos {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required category});
}
