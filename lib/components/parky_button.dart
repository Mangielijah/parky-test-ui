import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ParkyButton extends StatelessWidget {
  const ParkyButton({
    super.key,
    required this.onTap,
    required this.title,
    this.icon,
    this.fontSize = 19,
  });
  final String title;
  final double fontSize;
  final IconData? icon;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
          height: 50.h,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(14.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 25.w,
                  ),
                if (icon != null)
                  SizedBox(
                    width: 8.25.w,
                  ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize.sp,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
