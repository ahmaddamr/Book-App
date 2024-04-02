import 'package:bookly_app/manager/cubit/newest_books_cubit.dart';
import 'package:bookly_app/core/widgets/best_seller_widget.dart';
import 'package:bookly_app/core/widgets/featured_listView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ListViewItem(),
                FeaturedListView(),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Best Seller',
                  style: GoogleFonts.montserrat(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              BlocBuilder<NewestBooksCubit, NewestBooksState>(
                builder: (context, state) {
                  if (state is NewestBooksSuccess) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return BestSellerWIdget(
                          
                          bookModel: state.books[index],
                        );
                      },
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.books.length,
                    );
                  }else if (state is NewestBooksFailure)
                  {
                    return Text(state.error);
                  }else 
                  {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
