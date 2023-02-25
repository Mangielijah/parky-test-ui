import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParkyLogo extends StatelessWidget {
  const ParkyLogo({
    super.key,
    this.isWhite = false,
  });

  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      (isWhite) ? 'assets/images/splash_logo.png' : 'assets/images/logo.png',
      height: 56.h,
    );
  }
}
