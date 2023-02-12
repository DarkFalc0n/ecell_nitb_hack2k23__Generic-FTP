import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyledAppBar extends AppBar {
  final Widget? leadingWidget;
  final List<Widget>? actionWidgets;
  final Color color;
  final String? titleString;

  StyledAppBar(
      {super.key,
      this.leadingWidget,
      this.actionWidgets,
      this.titleString,
      this.color = Colors.white})
      : super(
          elevation: 0.0,
          backgroundColor: color,
          toolbarHeight: 72.h,
          title: Text(titleString ?? ""),
          leading: leadingWidget,
          actions: actionWidgets,
          centerTitle: true,
        );
}
