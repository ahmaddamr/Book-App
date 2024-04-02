part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksError extends FeaturedBooksState {
  final String error;
  FeaturedBooksError(this.error);
}

final class FeaturedBooksuccess extends FeaturedBooksState {
  final List<BookModel> books;
  FeaturedBooksuccess(this.books);
}
