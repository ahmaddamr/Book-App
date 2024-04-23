import 'package:bookly_app/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/widgets/bookDetails_item.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsItem(
        bookModel: widget.bookModel,
      ),
    );
  }
}
