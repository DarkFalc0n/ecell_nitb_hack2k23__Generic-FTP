import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyledAppBar extends AppBar {
  final Widget? leadingWidget;
  final List<Widget>? actionWidgets;

  StyledAppBar({
    super.key,
    this.leadingWidget,
    this.actionWidgets,
  }) : super(
          elevation: 0.0,
          backgroundColor: Colors.white,
          toolbarHeight: 72.h,
          leading: leadingWidget,
          actions: actionWidgets,
        );
}
