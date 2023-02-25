import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:parky/components/parky_button.dart';
import 'package:parky/components/ticker_tile.dart';
import 'package:parky/data/demo_data_set.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.black.withOpacity(0.04),
            child: Center(
              child: Image.asset(
                'assets/images/menu.png',
                width: 16.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.black.withOpacity(0.04),
            child: Center(
              child: Image.asset(
                'assets/images/notification_icon.png',
                width: 17.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 184.h,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4.h),
                  blurRadius: 4.r,
                  spreadRadius: 0.r,
                  color: Colors.black.withOpacity(0.05),
                ),
              ],
            ),
            // padding: EdgeInsets.all(16.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Balance',
                  style: GoogleFonts.inter(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 11.h,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '1.000',
                        style: GoogleFonts.inter(
                          fontSize: 48.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4.sp,
                          color: Colors.black,
                          // height: 38.sp,
                        ),
                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: Offset(0.0, -26.0.h),
                          child: Text(
                            'XAF',
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              letterSpacing: -1.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffABABAB),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ParkyButton(
                      onTap: () {},
                      icon: Icons.add,
                      fontSize: 14,
                      title: 'Credit your account',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Builder(builder: (context) {
              var groupListByDate = groupBy(
                demoDataSet,
                (obj) => obj['time']!.substring(0, 10),
              );
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: groupListByDate.length,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 6.h, bottom: 12.h),
                    itemBuilder: (context, index) {
                      final date =
                          List<String>.from(groupListByDate.keys)[index];
                      final List<Map<String, dynamic>> data =
                          List.from(groupListByDate.values)[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 6.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              DateFormat('EEEE, d MMMM, yyyy')
                                  .format(DateTime.parse(date)),
                              style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                letterSpacing: -0.15.sp,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          ...(data
                              .map(
                                (d) => Ticket(
                                  ticketData: d,
                                ),
                              )
                              .toList()),
                        ],
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        margin: EdgeInsets.only(bottom: 20.h, top: 20.h),
                        child: ParkyButton(
                          onTap: () {},
                          title: 'Demarrer un Stationnement',
                          // fontSize: 19,
                        )),
                  )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
