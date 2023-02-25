import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parky/components/logo.dart';
// ignore: unused_import
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () async {
        // context.pop();
        // Navigator.popUntil(context, (route) => route.isFirst);
        Router.neglect(context, () {
          GoRouter.of(context).pushReplacement('/signin');
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: ParkyLogo(
              isWhite: true,
            ),
          ),
        ],
      ),
    );
  }
}
