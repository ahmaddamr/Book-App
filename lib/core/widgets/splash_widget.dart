import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> SlidingAnimation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    SlidingAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // Get.to(() => const HomeScreen(),
        //     transition: Transition.fadeIn,
        //     duration: const Duration(milliseconds: 250));
        GoRouter.of(context).push('/HomeScreen');
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return SlideTransition(
              position: SlidingAnimation,
              child: Text(
                'Read Free Books',
                textAlign: TextAlign.center,
                style: GoogleFonts.andadaPro(fontWeight: FontWeight.bold),
              ),
            );
          },
        )
      ],
    );
  }
}
