import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

navigateTo(context, screen, bool isFinish) {
  if (isFinish) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        result: (route) => isFinish);
  } else {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }
}

flutterToast({required String msg, Color? textColor}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: textColor,
      textColor: Colors.white,
      fontSize: 16.0.sp);
}

Color randomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
