import 'package:ecell_nitb_hack2k23__generic_ftp/common/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestTrackPage extends StatelessWidget {
  const RequestTrackPage({Key? key}) : super(key: key);
  var order = {};



  Future<http.Response?> gerCredits() async {
  try {

    var url = Uri.https('esummit-back.onrender.com', 'creorders/track');
    var response = await http.post(
      url,
      body: jsonencode({"id":order['id']})
      headers: {
        "Content-type": "application/json",
      },
    );
    print(response.body);
    return response;
  } catch (err) {
    print(err);
    return null;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(
        color: const Color(0xFFA5C656),
        titleString: 'Requests',
        leadingWidget: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 19.h),
              child: Text(
                'Your Requests',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 330.w,
                height: 60.h,
                decoration: const BoxDecoration(
                  color: Color(0xFFE9F1D5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Request#1234',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF6F974B),
                            ),
                          ),
                          Text(
                            'Made on 12 Feb 2023',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF494949),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Track Pickup',
                            style: GoogleFonts.poppins(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Icon(
                            Icons.location_on,
                            color: Color(0xFF71994B),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            10.verticalSpace,
            Center(
              child: Container(
                width: 330.w,
                height: 60.h,
                decoration: const BoxDecoration(
                  color: Color(0xFFE9F1D5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Request#1234',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF6F974B),
                            ),
                          ),
                          Text(
                            'Made on 12 Feb 2023',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF494949),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Pickup \nCompleted',
                            style: GoogleFonts.poppins(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Icon(
                            Icons.task_alt_outlined,
                            color: Color(0xFF71994B),
                          ),
                        ],
                      )
                    ],
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
