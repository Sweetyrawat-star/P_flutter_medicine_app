import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class NavigatorUtils {
  static void moveToLoginScreen(BuildContext context) async {

/*    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => SplashScreen()));*/
  }

  static void moveToDashBoard(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  static void pushNamedDashBoard(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }

  static void moveToDashBoardTemp(BuildContext context) {
    /*Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => Home()));*/
  }
}

