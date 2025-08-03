// 📄 screen_size_extension.dart
// Extension methods for BuildContext to simplify responsive scaling

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'size_builder.dart';

/// 🇺🇸 Extension on BuildContext for responsive size and font scaling
/// 🇸🇦 امتداد على BuildContext لتسهيل القياسات المتجاوبة وتكبير النصوص
extension ScreenSize on BuildContext {
  /// Is the screen in landscape orientation?
  /// 🇸🇦 هل الشاشة في الوضع الأفقي؟
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  /// Logical height of the screen (auto adjusted by orientation)
  /// 🇸🇦 الارتفاع المنطقي للشاشة بعد احتساب الاتجاه
  double get screenHeight => isLandscape
      ? MediaQuery.sizeOf(this).width
      : MediaQuery.sizeOf(this).height;

  /// Logical width of the screen (auto adjusted by orientation)
  /// 🇸🇦 العرض المنطقي للشاشة بعد احتساب الاتجاه
  double get screenWidth => isLandscape
      ? MediaQuery.sizeOf(this).height
      : MediaQuery.sizeOf(this).width;

  /// Internal SizeBuilder access
  /// 🇸🇦 الوصول إلى الكائن الذي يحتوي نسب التحجيم
  SizeBuilder get sizeBuilder => SizeBuilder.of(this);

  /// Scaling factor for width
  /// 🇸🇦 نسبة التحجيم بناءً على العرض
  double get scaleWidth => sizeBuilder.width / sizeBuilder.baseSize.width;

  /// Scaling factor for height
  /// 🇸🇦 نسبة التحجيم بناءً على الارتفاع
  double get scaleHeight => sizeBuilder.height / sizeBuilder.baseSize.height;

  /// Calculates a height based on reference design (e.g. 20 becomes scaled height)
  /// 🇸🇦 تحويل قيمة ارتفاع من التصميم إلى ارتفاع فعلي متناسب
  double getHeight(num h) => h * scaleHeight;

  /// Calculates a width based on reference design
  /// 🇸🇦 تحويل قيمة عرض من التصميم إلى عرض فعلي متناسب
  double getWidth(num w) => w * scaleWidth;

  /// Calculates font size based on width scaling
  /// 🇸🇦 تحجيم حجم الخط استنادًا إلى العرض
  double getFontSize(num f) => f * scaleWidth;

  /// Calculates a minimum scale factor (for square/circle elements)
  /// 🇸🇦 إرجاع أصغر نسبة تحجيم (مفيد للعناصر المتساوية)
  double getMinSize(num f) => f * min(scaleWidth, scaleHeight);

  /// Padding for SafeArea (status bar, notch, etc)
  /// 🇸🇦 الهوامش الآمنة للشاشة
  EdgeInsets get safePadding => MediaQuery.of(this).padding;

  /// Device Pixel Ratio
  /// 🇸🇦 نسبة البكسلات إلى البكسلات المنطقية
  double get pixelRatio => MediaQuery.of(this).devicePixelRatio;


}


