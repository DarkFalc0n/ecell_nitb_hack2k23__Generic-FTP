import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyledButton extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const StyledButton({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFA7C957),
              Color(0xFF608A48),
            ]),
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}
