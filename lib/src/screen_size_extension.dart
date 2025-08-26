// 📄 screen_size_extension.dart
// Extension methods for BuildContext to simplify responsive scaling

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'size_builder.dart';

/// 🇺🇸 Extension on BuildContext for responsive size and font scaling
/// IQ امتداد على BuildContext لتسهيل القياسات المتجاوبة وتكبير النصوص
extension ScreenSize on BuildContext {
  /// Is the screen in landscape orientation?
  /// IQ هل الشاشة في الوضع الأفقي؟
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  /// Logical height of the screen (auto adjusted by orientation)
  /// IQ الارتفاع المنطقي للشاشة بعد احتساب الاتجاه
  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// Logical width of the screen (auto adjusted by orientation)
  /// IQ العرض المنطقي للشاشة بعد احتساب الاتجاه
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// Internal SizeBuilder access
  /// IQ الوصول إلى الكائن الذي يحتوي نسب التحجيم
  SizeBuilder get sizeBuilder => SizeBuilder.of(this);

  /// Scaling factor for width
  /// IQ نسبة التحجيم بناءً على العرض
  double get scaleWidth => sizeBuilder.width / sizeBuilder.baseSize.width;

  /// Scaling factor for height
  /// IQ نسبة التحجيم بناءً على الارتفاع
  double get scaleHeight => sizeBuilder.height / sizeBuilder.baseSize.height;

  /// Calculates a height based on reference design (e.g. 20 becomes scaled height)
  /// IQ تحويل قيمة ارتفاع من التصميم إلى ارتفاع فعلي متناسب
  double getHeight(num h) => h * scaleHeight;

  /// Calculates a width based on reference design
  /// IQ تحويل قيمة عرض من التصميم إلى عرض فعلي متناسب
  double getWidth(num w) => w * scaleWidth;

  /// Calculates font size based on width scaling
  /// IQ تحجيم حجم الخط استنادًا إلى العرض
  double getFontSize(num f) => isLandscape ? f * scaleHeight : f * scaleWidth;

  /// Calculates a minimum scale factor (for square/circle elements)
  /// IQ إرجاع أصغر نسبة تحجيم (مفيد للعناصر المتساوية)
  double getMinSize(num f) => f * min(scaleWidth, scaleHeight);

  /// Padding for SafeArea (status bar, notch, etc)
  /// IQ الهوامش الآمنة للشاشة
  EdgeInsets get safePadding => MediaQuery.of(this).padding;

  /// Device Pixel Ratio
  /// IQ نسبة البكسلات إلى البكسلات المنطقية
  double get pixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// Device DPI
  /// IQ نقطة توضيح لكل بيكسل
  int get dpi => (pixelRatio * 160).round();
}
