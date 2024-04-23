import 'package:bookly_app/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/screens/bookDetails.dart';
import 'package:bookly_app/screens/home.dart';
import 'package:bookly_app/screens/search.dart';
import 'package:bookly_app/screens/splash.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/HomeScreen',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/BookDetails',
        builder: (context, state) => BookDetails(
          bookModel: state.extra as BookModel,
        ),
      ),
      GoRoute(
        path: '/SearchView',
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
