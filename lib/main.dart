import 'package:bookly_app/utils/functions/app_router.dart';
import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/manager/cubit/featured_books_cubit.dart';
import 'package:bookly_app/manager/cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/domain/repos/homeRepoImp.dart';
import 'package:bookly_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewestBooksCubit(
            HomeRepoImp(
              ApiService(),
            ),
          )..newestBooks(),
        ),
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            HomeRepoImp(
              ApiService(),
            ),
          )..featuredBooks(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
