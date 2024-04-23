
import 'package:bloc/bloc.dart';
import 'package:bookly_app/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/domain/repos/homeRepo.dart';
import 'package:meta/meta.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepos) : super(NewestBooksInitial());
  final HomeRepos homeRepos;
  Future<void> newestBooks() async {
    emit(NewestBooksLoading());
    var data = await homeRepos.fetchNewestBooks();
    data.fold((failure) {
      emit(NewestBooksFailure(failure.error));
    }, (books) {
      emit(
        NewestBooksSuccess(books),
      );
    });
  }
}
