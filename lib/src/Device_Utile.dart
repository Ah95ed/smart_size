import 'package:flutter/material.dart';
import 'package:smart_sizer/smart_sizer.dart';

class DeviceUtils {
  static bool isMobile(BuildContext context) => context.screenWidth < 600;

  static bool isTablet(BuildContext context) =>
      context.screenWidth >= 600 && context.screenHeight < 1200;

  static bool isDesktop(BuildContext context) => context.screenHeight >= 1200;

  static T valueDecider<T>(
    BuildContext context, {
    required T onMobile,
    T? onTablet,
    T? onDesktop,
    T? others,
  }) {
    if (isMobile(context)) {
      return onMobile;
    } else if (isTablet(context) && onTablet != null) {
      return onTablet;
    } else if (isDesktop(context) && onDesktop != null) {
      return onDesktop;
    }
    return others ?? onMobile;
  }
}
