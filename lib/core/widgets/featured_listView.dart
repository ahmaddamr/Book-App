import 'package:bookly_app/manager/cubit/featured_books_cubit.dart';
import 'package:bookly_app/core/widgets/custom_error.dart';
import 'package:bookly_app/core/widgets/listView_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .push('/BookDetails', extra: state.books[index]);
                    },
                    child: ListViewItem(
                        imageUrl: state.books[index].volumeInfo?.imageLinks
                                ?.thumbnail ??
                            ''),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
          );
        } else if (state is FeaturedBooksError) {
          print(state);
          return CustomError(
            errMessage: state.error,
          );
        } else {
          print(state);
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
