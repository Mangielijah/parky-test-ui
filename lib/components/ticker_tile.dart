import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TicketStatus {
  ongoing,
  waiting,
  paid,
}

class Ticket extends StatefulWidget {
  const Ticket({super.key, required this.ticketData});

  final Map<String, dynamic> ticketData;

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  late final TicketStatus status;
  @override
  void initState() {
    status = TicketStatus.values
        .where((s) => s.name == (widget.ticketData['status'] as String))
        .first;
    super.initState();
  }

  Widget getStatus() {
    return Container(
      height: 20.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: status == TicketStatus.ongoing
            ? const Color.fromRGBO(255, 66, 98, 0.1)
            : status == TicketStatus.paid
                ? const Color.fromRGBO(0, 122, 255, 0.1)
                : const Color.fromRGBO(249, 115, 22, 0.1),
      ),
      child: Center(
        child: Text(
          status == TicketStatus.ongoing
              ? 'Ongoing'
              : status == TicketStatus.paid
                  ? 'Paid parking'
                  : 'Waiting for payment',
          style: GoogleFonts.inter(
            color: status == TicketStatus.ongoing
                ? const Color.fromRGBO(255, 66, 98, 1)
                : status == TicketStatus.paid
                    ? const Color.fromRGBO(0, 122, 255, 1)
                    : const Color.fromRGBO(249, 115, 22, 1),
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      padding: EdgeInsets.only(
        top: 16.w,
        left: 16.w,
        bottom: 16.w,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.ticketData['id'],
                        style: GoogleFonts.inter(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            letterSpacing: -0.4.sp),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      getStatus(),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(text: 'Start at '),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: Offset(0.0, -2.5.sp),
                            child: Text(
                              '.',
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                letterSpacing: -1.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffABABAB),
                              ),
                            ),
                          ),
                        ),
                        TextSpan(
                          text:
                              ' ${DateFormat.jm().format(DateTime.parse(widget.ticketData['time']))}',
                        )
                      ],
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (status == TicketStatus.ongoing)
              Container(
                color: const Color(0xffFF4262),
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Center(
                  child: Text(
                    'STOP',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: Colors.white,
                      letterSpacing: -0.15.sp,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
