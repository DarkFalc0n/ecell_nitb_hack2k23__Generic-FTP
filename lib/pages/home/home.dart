import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/widgets/widgets.dart';
import '../pickup_request/pickup_request_one.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: StyledAppBar(
        leadingWidget: Padding(
          padding: EdgeInsets.only(
            top: 24.h,
            bottom: 24.h,
            left: 30.w,
          ),
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: 28.w,
          ),
        ),
        actionWidgets: [
          Padding(
            padding: EdgeInsets.only(
              right: 30.w,
            ),
            child: Row(
              children: [
                Text(
                  'Alex Hales',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
                12.horizontalSpace,
                CircleAvatar(
                  foregroundColor: Colors.redAccent,
                  radius: 24.r,
                )
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          54.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.w),
            child: RichText(
              text: TextSpan(
                text: 'TRASH TODAY\n',
                style: GoogleFonts.oswald(
                  color: const Color(0xFF386641),
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
                children: [
                  TextSpan(
                    text: 'TREASURE \nTOMORROW.',
                    style: GoogleFonts.oswald(
                      color: const Color(0xFF386641),
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.sp,
                    ),
                  )
                ],
              ),
            ),
          ),
          60.verticalSpace,
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.elliptical(225, 75),
                ),
                child: Container(
                  width: double.infinity,
                  height: 371.2.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFFA7C957),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30.w,
                  right: 30.w,
                  top: 53.h,
                ),
                child: Container(
                  width: double.infinity,
                  height: 318.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: Offset(0, -2),
                        color: Color(0x26000000),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.r),
                      topRight: Radius.circular(18.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      23.09.verticalSpace,
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PickupRequestOnePage(),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            // color: const Color(0xFFE9F1D5),
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
                          width: 286.11.w,
                          height: 167.81.h,
                          child: Stack(
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.35.h),
                                      child: Image.asset(
                                        'assets/imgs/pickup.png',
                                        width: 192.1.w,
                                        height: 107.44.h,
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Request Pickup',
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          11.65.horizontalSpace,
                                          Text(
                                            String.fromCharCode(Icons
                                                .arrow_forward_outlined
                                                .codePoint),
                                            style: TextStyle(
                                              inherit: false,
                                              color: Colors.white,
                                              fontSize: 22.w,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: Icons
                                                  .arrow_forward_outlined
                                                  .fontFamily,
                                              package: Icons
                                                  .arrow_forward_outlined
                                                  .fontPackage,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(21.w),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.r),
                                ),
                                color: const Color(0xFFE9F1D5),
                              ),
                              height: 83.5.h,
                              width: 133.w,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 21.w,
                              right: 0.0,
                              bottom: 21.w,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.r),
                                ),
                                color: const Color(0xFFE9F1D5),
                              ),
                              height: 83.5.h,
                              width: 133.w,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
