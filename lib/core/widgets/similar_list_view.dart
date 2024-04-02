import 'package:bookly_app/manager/cubit/cubit/similar_books_cubit.dart';
import 'package:bookly_app/core/widgets/listView_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarListView extends StatelessWidget {
  const SimilarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return  Padding(
                  padding: EdgeInsets.all(6.0),
                  child: ListViewItem(
                    imageUrl:
                        state.books[index].volumeInfo?.imageLinks?.thumbnail??"",
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return Text(state.error);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
