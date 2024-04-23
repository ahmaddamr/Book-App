import 'package:bookly_app/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/widgets/bookAction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailsItem extends StatelessWidget {
  const BookDetailsItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.17),
                child: Container(
                  width: 170,
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image:  DecorationImage(
                        image: NetworkImage(
                            bookModel.volumeInfo?.imageLinks?.thumbnail??""),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                bookModel.volumeInfo?.title??"",
                // maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.arefRuqaa(
                    fontSize: 25, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                bookModel.volumeInfo?.authors?.first??'',
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 124, 124, 124),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.amber,
                    size: 28,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      bookModel.volumeInfo?.language??"",
                      style: GoogleFonts.montserrat(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Text(
                    bookModel.volumeInfo?.maturityRating??"",
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
                BooksAction(
                  bookModel: bookModel,
                ),
              const Expanded(
                child: SizedBox(
                  height: 45,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
