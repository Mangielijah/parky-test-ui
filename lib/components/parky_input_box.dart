import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ParkyInputBox extends StatefulWidget {
  const ParkyInputBox({
    Key? key,
    required this.inputController,
    this.hasInnerLabel = false,
    this.innerLabel = '',
    this.label = '',
    this.hint = '',
    this.formatText,
    this.width,
  }) : super(key: key);

  final double? width;
  final bool hasInnerLabel;
  final String innerLabel;
  final String label;
  final String hint;
  final TextEditingController inputController;
  final Function(String text)? formatText;

  @override
  State<ParkyInputBox> createState() => _ParkyInputBoxState();
}

class _ParkyInputBoxState extends State<ParkyInputBox> {
  final FocusNode inputFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    bool hasLabel = (widget.label.isNotEmpty);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        inputFocusNode.requestFocus();
      },
      child: SizedBox(
        width: widget.width ?? double.infinity,
        height: hasLabel ? 70.h : 50.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasLabel)
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: const Color(0xff979797),
                ),
              ),
            if (hasLabel)
              SizedBox(
                height: 4.h,
              ),
            Expanded(
              child: Container(
                height: 50.h,
                width: widget.width ?? double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.1)),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.spMax,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.hasInnerLabel)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 14.spMax,
                        ),
                        child: Text(
                          widget.innerLabel,
                          style: GoogleFonts.inter(
                            color: const Color(0xff979797),
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    if (widget.hasInnerLabel)
                      SizedBox(
                        width: 2.w,
                      ),
                    Expanded(
                      child: TextField(
                        focusNode: inputFocusNode,
                        controller: widget.inputController,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                        ),
                        onChanged: (value) => (widget.formatText == null)
                            ? () {}
                            : widget.formatText!(value),
                        decoration: InputDecoration(
                          hintMaxLines: 1,
                          border: InputBorder.none,
                          hintText: widget.hint,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
