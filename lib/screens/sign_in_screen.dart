import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parky/components/logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/components/parky_button.dart';
import 'package:parky/components/parky_input_box.dart';
import 'package:go_router/go_router.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController phoneInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Signin',
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
                  'Please enter your phone number to signin to your account',
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
              ParkyInputBox(
                inputController: phoneInputController,
                hasInnerLabel: true,
                innerLabel: '+237',
                hint: '6 72 00 00 97',
                formatText: (text) {
                  String value = text.trim().replaceAll(' ', '');
                  String preText = '';
                  if (value.length > 2) {
                    preText = value.substring(0, 1);
                    value = StringUtils.removeCharAtPosition(value, 1);
                  }
                  value = StringUtils.addCharAtPosition(value, ' ', -2,
                      repeat: true);
                  value = '$preText $value'.trim();
                  phoneInputController.text = value;
                  phoneInputController.selection =
                      TextSelection.collapsed(offset: value.length);
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              ParkyButton(
                onTap: () {
                  context.go('/verify');
                },
                title: 'Signin',
              )
            ],
          ),
        ),
      ),
    );
  }
}
