import 'package:bloc/bloc.dart';
import 'package:bookly_app/models/book_model/book_model.dart';
import 'package:bookly_app/repos/homeRepo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homerepos) : super(SimilarBooksInitial());
  final HomeRepos homerepos;
  Future<void> getSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var data = await homerepos.fetchSimilarBooks(category: category);
    data.fold((Failure) {
      emit(
        SimilarBooksFailure(Failure.error),
      );
    }, (books) {
      emit(
        SimilarBooksSuccess(books),
      );
    });
  }
}
