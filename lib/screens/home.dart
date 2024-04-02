import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/core/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 280),
                child: Image.asset(
                  AssetsData.logo,
                  alignment: Alignment.centerLeft,
                  width: 75,
                  height: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      GoRouter.of(context).push('/SearchView');
                    },
                    icon: const Icon(
                      Icons.search_rounded,
                      size: 30,
                    )),
              )
            ],
          )
        ],
      ),
      body: const HomeWidget(),
    );
  }
}
