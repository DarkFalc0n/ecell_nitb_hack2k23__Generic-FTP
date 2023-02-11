import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const List<Map<String, String>> confirmTile = [
  {'icon': 'assets/icons/paper.png', 'desc': 'Books/\nNewspaper'},
  {'icon': 'assets/icons/cardboard.png', 'desc': 'Cardboard'},
  {'icon': 'assets/icons/glass.png', 'desc': 'Glass items'},
  {'icon': 'assets/icons/plastic.png', 'desc': 'PET bottles/\nwrappers'},
  {'icon': 'assets/icons/cloth.png', 'desc': 'Garments'},
  {'icon': 'assets/icons/metal.png', 'desc': 'Metal scraps'},
  {'icon': 'assets/icons/ewaste.png', 'desc': 'Electronic \nappliances'},
  {'icon': 'assets/icons/styrofoam.png', 'desc': 'Thermocol '}
];

class CategoryTile extends StatelessWidget {
  final String desc;
  final String iconPath;

  const CategoryTile({
    Key? key,
    required this.desc,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: const Color(0xFFE9F1D5),
        ),
        height: 88.h,
        width: 100.w,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 45.w,
              height: 45.w,
              child: Image.asset(
                iconPath,
              ),
            ),
            Text(
              desc,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
