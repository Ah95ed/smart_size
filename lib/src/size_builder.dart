// 📄 size_builder.dart
// Part of smart_sizer package

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 🇺🇸 InheritedWidget that provides the base and current screen sizes
/// for scaling purposes.
///
/// IQ ويدجت توريث (وراثي) يوفر الحجم المرجعي وحجم الشاشة الحالي
/// لحساب نسبة التحجيم للعناصر.
class SizeBuilder extends InheritedWidget {
  /// Reference screen size used for design (e.g. Size(375, 812))
  /// 📏 الحجم المرجعي الذي تم التصميم بناءً عليه
  final Size baseSize;

  /// Actual screen height in logical pixels
  /// 🟦 الارتفاع الفعلي للشاشة الحالية بالبكسلات المنطقية
  final double height;

  /// Actual screen width in logical pixels
  /// 🟥 العرض الفعلي للشاشة الحالية بالبكسلات المنطقية
  final double width;

  const SizeBuilder({
    super.key,
    required super.child,
    required this.baseSize,
    required this.height,
    required this.width,
  });

  /// Access the nearest SizeBuilder up the widget tree.
  /// 🔍 استخدام SizeBuilder في أي BuildContext
  static SizeBuilder of(BuildContext context) {
    final sizeBuilder = context
        .dependOnInheritedWidgetOfExactType<SizeBuilder>();
    if (sizeBuilder == null) {
      throw FlutterError(
        '[smart_sizer] SizeBuilder not found in widget tree. Make sure to wrap your app with SizeBuilder.',
      );
    }
    return sizeBuilder;
  }

  @override
  bool updateShouldNotify(covariant SizeBuilder oldWidget) {
    return baseSize != oldWidget.baseSize ||
        height != oldWidget.height ||
        width != oldWidget.width;
  }
}
