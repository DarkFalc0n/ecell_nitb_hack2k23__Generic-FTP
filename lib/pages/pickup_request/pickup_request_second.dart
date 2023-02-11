import 'package:ecell_nitb_hack2k23__generic_ftp/pages/pickup_request/pickup_request_third.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/widgets/widgets.dart';

class PickupRequestSecondPage extends StatelessWidget {
  const PickupRequestSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(
        titleString: 'Pickup Request',
        color: const Color(0xFFA5C656),
        leadingWidget: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 20.h,
        ),
        child: Column(
          children: [
            Text(
              'What is the estimated quantity of waste?',
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            StyledButton(
              height: 50.h,
              width: 150.w,
              onClick: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PickupRequestThirdPage(),
                ),
              ),
              child: Center(
                child: Text(
                  'Next',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
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
