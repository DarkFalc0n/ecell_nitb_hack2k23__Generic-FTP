import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const List<Map<String, dynamic>> categoryTile = [
  {
    'icon': 'assets/icons/paper.png',
    'desc': 'Books/\nNewspaper',
    'isSelected': false,
  },
  {
    'icon': 'assets/icons/cardboard.png',
    'desc': 'Cardboard',
    'isSelected': false,
  },
  {
    'icon': 'assets/icons/glass.png',
    'desc': 'Glass items',
    'isSelected': false,
  },
  {
    'icon': 'assets/icons/plastic.png',
    'desc': 'PET bottles/\nwrappers',
    'isSelected': false,
  },
  {
    'icon': 'assets/icons/cloth.png',
    'desc': 'Garments',
    'isSelected': false,
  },
  {
    'icon': 'assets/icons/metal.png',
    'desc': 'Metal scraps',
    'isSelected': false,
  },
  {
    'icon': 'assets/icons/ewaste.png',
    'desc': 'Electronic \nappliances',
    'isSelected': false,
  },
  {
    'icon': 'assets/icons/styrofoam.png',
    'desc': 'Thermocol',
    'isSelected': false,
  }
];

class CategoryTile extends StatefulWidget {
  final String desc;
  final String iconPath;

  // final VoidCallback onClick;

  const CategoryTile({
    Key? key,
    required this.desc,
    required this.iconPath,
    // required this.onClick,
  }) : super(key: key);

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: const Color(0xFFE9F1D5),
              border: isSelected
                  ? Border.all(
                      width: 2,
                      color: const Color(0xFF71994B),
                    )
                  : const Border(),
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
                    widget.iconPath,
                  ),
                ),
                Text(
                  widget.desc,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          isSelected
              ? Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.task_alt,
                    color: const Color(0xFF71994B),
                    size: 24.w,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
