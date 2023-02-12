import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/widgets/widgets.dart';
import 'pickup_request_second.dart';

class PickupRequestOnePage extends StatelessWidget {
  const PickupRequestOnePage({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(
        color: const Color(0xFFA5C656),
        titleString: 'Pickup Request',
        leadingWidget: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 19.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What types of waste would you like us to take care of?',
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Select all that apply',
              style: GoogleFonts.poppins(
                color: const Color(0xFF729A4B),
                fontSize: 12.sp,
              ),
            ),
            32.verticalSpace,
            SizedBox(
              width: 330.w,
              height: 294.h,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.h,
                children: categoryTile
                    .map(
                      (e) => CategoryTile(
                        desc: e['desc'].toString(),
                        iconPath: e['icon'].toString(),
                      ),
                    )
                    .toList(),
              ),
            ),
            40.verticalSpace,
            Center(
              child: StyledButton(
                width: 150.w,
                height: 50.h,
                onClick: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => const PickupRequestSecondPage(),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Next',
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
