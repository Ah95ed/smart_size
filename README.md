# 📦 smart_sizer

A lightweight and flexible Flutter package that helps you build responsive UIs based on a fixed reference screen size. Automatically scale width, height, font size, and more for all devices.

📱📲📺 Adapt your app beautifully on mobile, tablet, and desktop.

---

## 🚀 Installation

```yaml
dependencies:
  smart_sizer: ^1.0.3
```

Then:
```bash
flutter pub get
```

---

## ✅ Usage

### 1️⃣ Wrap your app with `SizeBuilder` in `MyHomePage`:

```dart
import 'package:flutter/material.dart';
import 'package:smart_sizer/smart_sizer.dart';

void main() {
  runApp(
      return const MyApp(),
  );
}
```

### or 
```dart

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   SizeBuilder(
          baseSize: Size(360, 690),
          height: context.screenHeight,
          width: context.screenWidth,
          child: MaterialApp(
      
            debugShowCheckedModeBanner: false,
            home : MainScreen(),
          ));
  }
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
          width: context.getWidth(60),
          height: context.getHeight(20),
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

## 📐 Available Extensions

| Extension               | Description                        |
|-------------------------|------------------------------------|
| `context.getWidth(x)`   | Scaled width from reference design |
| `context.getHeight(x)`  | Scaled height from reference design|
| `context.getFontSize(x)`| Font size scaled to screen         |
| `context.getMinSize(x)` | Minimum scaling factor             |
| `context.scaleWidth`    | Current width ratio to base        |
| `context.scaleHeight`   | Current height ratio to base       |
| `context.isMobile`      | Is device considered mobile        |
| `context.isTablet`      | Is device a tablet                 |
| `context.isDesktop`     | Is device desktop                  |
| `context.safePadding`   | Safe area (notch, status bar, etc) |

---

## 💡 Why use smart_sizer?

- Simple and predictable scaling
- Easy to integrate into any Flutter project
- Breakpoint support (mobile / tablet / desktop)
- Useful for localization and text scaling

---

## 📄 License
MIT © 2025 Ahmed Shaker

> Built with ❤️ for responsive design enthusiasts

---

For help or contributions, feel free to open issues or PRs on GitHub.

📬 Suggestions? Contact me at [GitHub page placeholder]().
