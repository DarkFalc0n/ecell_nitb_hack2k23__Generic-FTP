import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(
            top: 24.h,
            bottom: 24.h,
            left: 30.w,
          ),
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: 24.w,
          ),
        ),
        toolbarHeight: 72.h,
        actions: [
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
                    fontSize: 12.sp,
                  ),
                ),
                6.horizontalSpace,
                const CircleAvatar(
                  foregroundColor: Colors.redAccent,
                )
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          60.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.w),
            child: RichText(
              text: TextSpan(
                text: 'TRASH TODAY\n',
                style: GoogleFonts.oswald(
                  color: const Color(0xFF386641),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
                children: [
                  TextSpan(
                    text: 'TREASURE \nTOMORROW.',
                    style: GoogleFonts.oswald(
                      color: const Color(0xFF386641),
                      fontSize: 38.sp,
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
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFE9F1D5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          ),
                        ),
                        width: 286.11.w,
                        height: 167.81.h,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment(0, 0.3),
                                    stops: [-2, 1],
                                    colors: [
                                      Color(0xFF45473E),
                                      Color(0xAA45473E),
                                    ],
                                  ),
                                ),
                                height: 57.h,
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 15.35.h),
                                  child: Image.asset(
                                    'assets/imgs/pickup.png',
                                    width: 192.1.w,
                                    height: 107.44.h,
                                  ),
                                ),
                                Text(
                                  'Request Pickup ->',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
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
