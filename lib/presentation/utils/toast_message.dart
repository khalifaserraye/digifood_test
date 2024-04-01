import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required message, int? time}) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: time ?? 1,
    backgroundColor: mainColor,
    textColor: Colors.white,
    fontSize: 16.0);
