import 'package:bookly_app/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textcolor: Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              text: 'Free',
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                Uri Url =
                    Uri.parse(bookModel.volumeInfo?.previewLink ?? "null");
                if (await canLaunchUrl(Url)) {
                  await launchUrl(Url);
                }
              },
              backgroundColor: const Color(0xffEF8262),
              textcolor: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              text: 'Free Preview',
            ),
          )
        ],
      ),
    );
  }
}
