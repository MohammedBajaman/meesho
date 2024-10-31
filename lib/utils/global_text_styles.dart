import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GlobalTextStyles {

  // heading 1
  Text h1(String title){
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'Manrope',
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        height: 21.6 / 18,
        color: Color(0xff0E0E0E),
      ),
      textAlign: TextAlign.left,
    );
  }

  // heading 2
  Text h2(String title){
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 15.5.sp,
        fontWeight: FontWeight.w600,
        height: 18 / 14,
        color: const Color(0xff000000),
      ),
    );
  }

  // heading 3
  Text h3(String title){
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'Manrope',
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        height: 18 / 12,
        color: Color(0xff000000),
      ),
      textAlign: TextAlign.center,
    );
  }

  // heading 4
  Text h4(String title, {bool isSelected = false}){
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Manrope',
        // fontSize: 10.0,
        fontSize: 12.6.sp,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        height: 18 / 10,
        color: const Color(0xff000000),
      ),
      textAlign: TextAlign.center,
    );
  }
}