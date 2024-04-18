import 'package:bookly_app/errors/failure.dart';
import 'package:bookly_app/models/book_model/book_model.dart';
import 'package:bookly_app/features/domain/repos/homeRepo.dart';
import 'package:bookly_app/services/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepos {
  final ApiService apiService;
  HomeRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.getRequest(
          url:
              'volumes?Filtering=free-ebooks&q=subject:flutter&Sorting=newest');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(
          BookModel.fromJson(element),
        );
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(FailureBody(e.message.toString()));
      }
      return left(
        FailureBody(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.getRequest(
          url: 'volumes?Filtering=free-ebooks&q=subject:fantasy');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(
          BookModel.fromJson(element),
        );
      }
      return right(books);
    } catch (e) {
      return left(
        FailureBody(
          e.toString(),
        ),
      );
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required category})async {
      try {
      var data = await apiService.getRequest(
          url:
              'volumes?Filtering=free-ebooks&q=subject:arabic&Sorting=relevance');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(
          BookModel.fromJson(element),
        );
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(FailureBody(e.message.toString()));
      }
      return left(
        FailureBody(
          e.toString(),
        ),
      );
    }
  
  }
}
