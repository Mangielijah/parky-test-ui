import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/components/parky_button.dart';
import 'package:parky/components/parky_input_box.dart';
import 'package:go_router/go_router.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController immatriculationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Complete your profile',
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
              ParkyInputBox(
                inputController: fullNameController,
                label: 'Full name',
                hint: 'John Doe',
              ),
              SizedBox(
                height: 16.h,
              ),
              ParkyInputBox(
                inputController: brandController,
                label: 'The brand of your vehicle',
                hint: 'Mercedes',
              ),
              SizedBox(
                height: 16.h,
              ),
              ParkyInputBox(
                inputController: modelController,
                label: 'The model of your vehicle',
                hint: 'Mercedes',
              ),
              SizedBox(
                height: 16.h,
              ),
              ParkyInputBox(
                inputController: immatriculationController,
                label: 'Immatriculation',
                hint: 'SW 505 CD',
              ),
              SizedBox(
                height: 24.h,
              ),
              ParkyButton(
                onTap: () {
                  context.go('/dashboard');
                },
                title: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
