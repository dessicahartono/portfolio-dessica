// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/colors.dart';

class AppButtons {
  static MaterialButton buildMaterialButton({
    required String buttonName,
    required VoidCallback onTap,
    required Null Function() pressed,
  }) {
    return MaterialButton(
      onPressed: onTap,
      color: kLightGrey,
      splashColor: kDarkGrey,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      hoverColor: kGrey,
      elevation: 7,
      height: 46,
      minWidth: 130,
      focusElevation: 12,
      child: Text(
        buttonName,
        style: TextStyle(color: kBlack),
      ),
    );
  }
}
