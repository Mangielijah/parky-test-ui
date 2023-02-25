import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parky/components/logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/components/parky_button.dart';
import 'package:parky/components/parky_input_box.dart';
import 'package:go_router/go_router.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  TextEditingController digitOneController = TextEditingController();
  TextEditingController digitTwoController = TextEditingController();
  TextEditingController digitThreeController = TextEditingController();
  TextEditingController digitFourController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Verify your account',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 17.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ParkyLogo(),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Text(
                  'Please enter the code you receive by SMS to confirm your account ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    // height: 20,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 19.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ParkyInputBox(
                    width: 50.h,
                    inputController: digitOneController,
                    formatText: (text) {
                      String value = text.trim().replaceAll(' ', '');
                      String newValue = (value.length > 1)
                          ? value.substring(value.length - 1)
                          : value;
                      digitOneController.text = newValue;
                      digitOneController.selection =
                          TextSelection.collapsed(offset: newValue.length);
                      if (digitOneController.text.isNotEmpty) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  ParkyInputBox(
                    width: 50.h,
                    inputController: digitTwoController,
                    formatText: (text) {
                      String value = text.trim().replaceAll(' ', '');
                      String newValue = (value.length > 1)
                          ? value.substring(value.length - 1)
                          : value;
                      digitTwoController.text = newValue;
                      digitTwoController.selection =
                          TextSelection.collapsed(offset: newValue.length);
                      if (digitTwoController.text.isNotEmpty) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  ParkyInputBox(
                    width: 50.h,
                    inputController: digitThreeController,
                    formatText: (text) {
                      String value = text.trim().replaceAll(' ', '');
                      String newValue = (value.length > 1)
                          ? value.substring(value.length - 1)
                          : value;
                      digitThreeController.text = newValue;
                      digitThreeController.selection =
                          TextSelection.collapsed(offset: newValue.length);
                      if (digitThreeController.text.isNotEmpty) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  ParkyInputBox(
                    width: 50.h,
                    inputController: digitFourController,
                    formatText: (text) {
                      String value = text.trim().replaceAll(' ', '');
                      String newValue = (value.length > 1)
                          ? value.substring(value.length - 1)
                          : value;
                      digitFourController.text = newValue;
                      digitFourController.selection =
                          TextSelection.collapsed(offset: newValue.length);
                      if (digitFourController.text.isNotEmpty) {
                        // FocusScope.of(context).requestFocus(FocusNode());
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              ParkyButton(
                onTap: () {
                  context.go('/complete_profile');
                },
                title: 'Confirm',
              ),
              SizedBox(
                height: 12.h,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Resend the code',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
