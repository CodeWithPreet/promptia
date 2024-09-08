import 'package:flutter/material.dart';

import 'package:promptia/core/core.dart';

ButtonStyle commonButtonStyle({
  double? height = NumberConstants.n10 * 4,
  double? width = NumberConstants.n10 * 30,
  Color? foregroundColor = AppColor.whiteColor,
  Color? backgroundColor = AppColor.blackColor,
}) {
  return ButtonStyle(
    minimumSize: WidgetStateProperty.all(
      //  Size.fromHeight(n10 * 4),
      Size(width!, height!),
    ),
    foregroundColor: WidgetStateProperty.all(foregroundColor),
    backgroundColor: WidgetStateProperty.all(backgroundColor),
  );
}
