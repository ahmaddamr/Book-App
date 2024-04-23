import 'package:bloc/bloc.dart';
import 'package:bookly_app/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/domain/repos/homeRepo.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homerepos) : super(FeaturedBooksInitial());
  final HomeRepos homerepos;
  Future<void> featuredBooks() async {
    emit(FeaturedBooksLoading());
    var data = await homerepos.fetchFeaturedBooks();
    data.fold((failure) {
      emit(FeaturedBooksError(failure.error));
    }, (books) {
      emit(FeaturedBooksuccess(books));
    });
  }
}
