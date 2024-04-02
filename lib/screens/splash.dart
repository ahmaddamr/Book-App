import 'package:bookly_app/core/widgets/splash_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashWidget(),
    );
  }
}
