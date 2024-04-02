import 'package:bookly_app/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class BestSellerWIdget extends StatelessWidget {
  // const BestSellerWIdget({super.key, required this.imageUrl, required this.title, required this.author, required this.price});
  // final String imageUrl ;
  // final String title ;
  // final String author ;
  // final String price ;
  // final String rating ;
  final BookModel bookModel;

  const BestSellerWIdget({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/BookDetails',extra:bookModel );
      },
      child: Card(
        color: Colors.transparent,
        margin: const EdgeInsets.all(17),
        elevation: 0,
        child: Row(
          children: [
            Container(
              width: 70,
              height: 105,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                    image: NetworkImage(
                        bookModel.volumeInfo?.imageLinks?.thumbnail ?? ""),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo?.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.arefRuqaa(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    bookModel.volumeInfo?.authors?.first ?? "",
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Free',
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
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
                          '${bookModel.volumeInfo?.language}',
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Text(
                        '${bookModel.volumeInfo?.maturityRating}',
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
