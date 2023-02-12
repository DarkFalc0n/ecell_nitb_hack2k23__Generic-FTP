import 'package:ecell_nitb_hack2k23__generic_ftp/pages/confirm_request/confirm_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/widgets/widgets.dart';

class PickupRequestSecondPage extends StatelessWidget {
  const PickupRequestSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: StyledAppBar(
        color: const Color(0xFFA5C656),
        titleString: 'Pickup Request',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 20.h,
        ),
        child: Column(
          children: [
            Text(
              'What is the pickup location?',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            22.verticalSpace,
            StyledButton(
              height: 50.h,
              width: 330.w,
              onClick: () {},
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.near_me,
                    color: Colors.white,
                  ),
                  Text(
                    'Use my current location',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            22.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: 0,
                    endIndent: 12.w,
                    thickness: 1.3.h,
                    height: 1.h,
                  ),
                ),
                Text(
                  'or',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF818181),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Expanded(
                  child: Divider(
                    indent: 10,
                    endIndent: 12.w,
                    thickness: 1.3.h,
                    height: 1.h,
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xFFE1E1E1),
                filled: true,
                hintText: 'Search for location',
                suffixIcon: const Icon(Icons.search),
              ),
            ),
            46.verticalSpace,
            StyledButton(
              height: 50.h,
              width: 200.w,
              onClick: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConfirmRequestPage(),
                ),
                (route) => false,
              ),
              child: Center(
                child: Text(
                  'Confirm location',
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
