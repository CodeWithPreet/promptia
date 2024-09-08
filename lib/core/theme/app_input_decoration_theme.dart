import 'package:flutter/material.dart';
import 'package:promptia/core/constants/constants.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme lightTheme = InputDecorationTheme(
    // contentPadding: const EdgeInsets.symmetric(
    //     vertical: NumberConstants.n10, horizontal: NumberConstants.n10 * 2),
    // filled: true,
    //fillColor: Colors.grey.shade200,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(NumberConstants.n10 * 2),
      // borderSide: const BorderSide(
      //   width: NumberConstants.n2,
      //   color: AppColor.blackColor,
      // ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(NumberConstants.n10 * 2),
      // borderSide:
      //     BorderSide(width: NumberConstants.n2, color: Colors.grey.shade400),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(NumberConstants.n10 * 2),
      borderSide: const BorderSide(
        width: NumberConstants.n2,
        color: Colors.grey,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(NumberConstants.n10 * 2),
      // borderSide: BorderSide(width: NumberConstants.n2, color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(NumberConstants.n10 * 2),
      borderSide:
          const BorderSide(width: NumberConstants.n2, color: Colors.grey),
    ),
    errorStyle: TextStyle(color: Colors.red.shade700),
    labelStyle: const TextStyle(color: Colors.black),
    hintStyle: const TextStyle(color: Colors.grey),
  );

  // static InputDecorationTheme darkTheme = InputDecorationTheme(
  //   // contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  //   // filled: true,
  //   // fillColor: Colors.grey.shade800,
  //   border: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(NumberConstants.n10 * 2),
  //     // borderSide:
  //     //     BorderSide(width: NumberConstants.n2, color: Colors.grey.shade700),
  //   ),
  //   enabledBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(NumberConstants.n10 * 2),
  //     // borderSide:
  //     //     BorderSide(width: NumberConstants.n2, color: Colors.grey.shade700),
  //   ),
  //   focusedBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(NumberConstants.n10 * 2),
  //     borderSide: const BorderSide(
  //       width: NumberConstants.n2,
  //     ),
  //   ),
  //   errorBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(NumberConstants.n10 * 2),
  //     // borderSide:
  //     //     BorderSide(width: NumberConstants.n2, color: Colors.red.shade700),
  //   ),
  //   focusedErrorBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(NumberConstants.n10 * 2),
  //     borderSide:
  //         BorderSide(width: NumberConstants.n2, color: Colors.red.shade900),
  //   ),
  // );
}
