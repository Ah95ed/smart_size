# 📦 smart_sizer

A lightweight and flexible Flutter package that helps you build responsive UIs based on a fixed reference screen size. Automatically scale width, height, font size, and more for all devices.

📱📲📺 Adapt your app beautifully on mobile, tablet, and desktop.

---

### 🇸🇦 ما هو smart_sizer؟

باكج خفيف ومرن لتصميم واجهات فلاتر متجاوبة تلقائيًا، اعتمادًا على حجم شاشة مرجعي (مثل iPhone X). يقوم بحساب وتحجيم العرض، الارتفاع، وحجم الخط وغيرها.

🧠 مناسب لبناء تطبيقات تعمل على جميع الشاشات من الهاتف حتى التابلت والكمبيوتر.

---

## 🚀 Installation | التثبيت

```yaml
dependencies:
  smart_sizer: ^1.0.0
```

ثم:
```bash
flutter pub get
```

---

## ✅ Usage | الاستخدام

### 1️⃣ Wrap your app with `SizeBuilder` in `main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:smart_sizer/smart_sizer.dart';

void main() {
  runApp(LayoutBuilder(
    builder: (context, constraints) {
      return SizeBuilder(
        baseSize: const Size(375, 812), // iPhone X design size
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: const MyApp(),
      );
    },
  ));
}
```

### 2️⃣ Use extension methods inside your widgets:

```dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: context.getWidth(60),     // 60% width
          height: context.getHeight(20),   // 20% height
          color: Colors.blue,
          child: Text(
            'Hello Ahmed',
            style: TextStyle(fontSize: context.getFontSize(16)),
          ),
        ),
      ),
    );
  }
}
```

---

## 📐 Available Extensions | الامتدادات المتاحة

| Extension               | Description (EN)                        | الوصف (عربي)                         |
|-------------------------|------------------------------------------|---------------------------------------|
| `context.getWidth(x)`   | Scaled width from reference design       | حساب عرض نسبي من التصميم             |
| `context.getHeight(x)`  | Scaled height from reference design      | حساب ارتفاع نسبي من التصميم          |
| `context.getFontSize(x)`| Font size scaled to screen               | تحجيم الخط حسب حجم الشاشة            |
| `context.getMinSize(x)` | Minimum scaling factor                   | أقل نسبة تحجيم (للعناصر الدائرية)   |
| `context.scaleWidth`    | Current width ratio to base              | نسبة العرض الحالية للمرجع            |
| `context.scaleHeight`   | Current height ratio to base             | نسبة الارتفاع الحالية للمرجع         |
| `context.isMobile`      | Is device considered mobile              | هل الجهاز موبايل؟                    |
| `context.isTablet`      | Is device a tablet                       | هل الجهاز تابلت؟                     |
| `context.isDesktop`     | Is device desktop                        | هل الجهاز كمبيوتر مكتبي؟             |
| `context.safePadding`   | Safe area (notch, status bar, etc)       | هوامش آمنة للشاشة                    |

---

## 💡 Why use smart_sizer?

- Simple and predictable scaling
- Easy to integrate into any Flutter project
- Breakpoint support (mobile / tablet / desktop)
- Useful for localization and text scaling

### 🟢 ليش تستخدم smart_sizer؟
- تحجيم ذكي وسهل لكل الأجهزة
- يدعم تكبير النصوص وتعدد الاتجاهات
- يقلل من الأكواد الثابتة (hardcoded sizes)

---

## 📄 License
MIT © 2025 أحمد شاكر

> Built with ❤️ for responsive design enthusiasts

---

For help or contributions, feel free to open issues or PRs on GitHub.

📬 Suggestions? Contact me at [GitHub page placeholder]().
