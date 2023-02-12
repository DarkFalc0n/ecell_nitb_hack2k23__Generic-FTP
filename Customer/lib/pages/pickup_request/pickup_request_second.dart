import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../common/widgets/widgets.dart';
import '../confirm_request/confirm_request.dart';

Future<http.Response?> sendReq() async {
  try {
    String jsonData =
        await rootBundle.loadString('lib/data/request_order.json');

    var url = Uri.https('esummit-back.onrender.com', 'order/createorder');
    var response = await http.post(
      url,
      body: jsonData,
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
              onClick: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => const AlertDialog(
                    content: CircularProgressIndicator(
                      color: Color(0xFFA7C957),
                    ),
                  ),
                );
                sendReq().then(
                  (value) {
                    if (value!.statusCode == 200) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConfirmRequestPage(),
                        ),
                        (_) => false,
                      );
                    }
                  },
                );
              },
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
