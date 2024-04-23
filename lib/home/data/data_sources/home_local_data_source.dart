import 'package:bookly_app/home/data/models/book_model/book_model.dart';

abstract class HomeLocalDataSource {
  List<BookModel> fetchNewestBooks();
  List<BookModel> fetchFeaturedBooks();
}
 