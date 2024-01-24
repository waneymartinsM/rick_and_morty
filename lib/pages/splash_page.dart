import 'package:flutter/material.dart';
import 'package:rick_and_morty/pages/home_page.dart';
import 'package:rick_and_morty/utils/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.body,
      body: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 2.0).animate(_controller),
          child: Container(
            height: 280,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/portal.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
