import 'package:ecell_nitb_hack2k23__generic_ftp/common/widgets/app_bar.dart';
import 'package:ecell_nitb_hack2k23__generic_ftp/common/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({Key? key}) : super(key: key);



  Future<http.Response?> gerCredits() async {
  try {

    var url = Uri.https('esummit-back.onrender.com', 'credits/creatgetfinalcreditsorder');
    var response = await http.post(
      url,
      body: jsonencode({"id":user['id']})
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
        titleString: 'Credits',
        leadingWidget: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0.w,
              vertical: 19.0.h,
            ),
            child: Text(
              'Your Credits',
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Center(
            child: Image.asset('assets/imgs/coin.png'),
          ),
          Center(
            child: Text(
              '80',
              style: GoogleFonts.poppins(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF494949),
              ),
            ),
          ),
          39.verticalSpace,
          Center(
            child: StyledButton(
              height: 50.h,
              width: 150.w,
              onClick: () {},
              child: Center(
                child: Text(
                  'Redeem',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          48.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'History',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                12.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Request#12334',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '23.01.2023',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '+7',
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 24.w,
                          child: Image.asset('assets/imgs/coin.png'),
                        ),
                      ],
                    )
                  ],
                ),
                9.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Request#12334',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '23.01.2023',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '+7',
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 24.w,
                          child: Image.asset('assets/imgs/coin.png'),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
