# 📦 smart_sizer

A lightweight and flexible Flutter package that helps you build responsive UIs based on a fixed reference screen size. Automatically scale width, height, font size, and more for all devices.

📱📲📺 Adapt your app beautifully on mobile, tablet, and desktop.

---

## 🚀 Installation

```yaml
dependencies:
  smart_sizer: ^1.0.10
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

### More example


```dart

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(context.getWidth(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: context.getFontSize(22),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: context.getHeight(20)),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: context.getWidth(16),
                  vertical: context.getHeight(12),
                ),
              ),
            ),
            SizedBox(height: context.getHeight(16)),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: context.getWidth(16),
                  vertical: context.getHeight(12),
                ),
              ),
            ),
            SizedBox(height: context.getHeight(24)),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: context.getHeight(14),
                  horizontal: context.getWidth(40),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: context.getFontSize(16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```

 ### 3️⃣ Use DeviceUtils methods inside your widgets:


```dart


class GridExampleScreen extends StatelessWidget {
  const GridExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive GridView")),
      backgroundColor: AppColors.accent,
      body: Padding(
        padding: EdgeInsets.all(context.getWidth(12)),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // Use GridView to All OS and Device
            crossAxisCount: DeviceUtils.valueDecider(
              context,
              onMobile: 2,
              onTablet: 3,
              onDesktop: 4,
            ),
            crossAxisSpacing: context.getWidth(10),
            mainAxisSpacing: context.getHeight(10),
            childAspectRatio: 1, 
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(context.getMinSize(12)),
              ),
              child: Text(
                "Item ${index + 1}",
                style: TextStyle(
                  fontSize: context.getFontSize(14),
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
```


### 4️⃣ Use SizeBuilder in card widgets :

```dart 

/// 📄 Example screen: A responsive ListView of Cards
/// This screen demonstrates how to create a **responsive list of cards**
/// using `SizeBuilder` and `smart_sizer` utilities.
/// 
/// Features:
/// ✅ Each card adapts in height, width, and font size 🪄
/// ✅ Includes interactive tap and button actions 🎯
/// ✅ Example of using `context.getFontSize`, `context.getWidth`, and `context.getHeight`
/// 
/// Perfect for showing lists, menus, or catalog items 📋

class ResponsiveCardListScreen extends StatelessWidget {
  const ResponsiveCardListScreen({super.key});

  
  @override
  Widget build(BuildContext context) {

 final items = List.generate(12, (i) => {
      'title': 'Card title ${i + 1}',
      'subtitle': 'This is a brief description of item ${i + 1}.',
      'icon': Icons.widgets,
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Responsive Cards',
          style: TextStyle(fontSize: context.getFontSize(18)),
        ),
      ),
      body: Container(

        height: context.sizeBuilder.height,
        child: SizeBuilder( baseSize: Size(250,250),
          height: context.getMinSize(250),
          width: context.getMinSize(250),
          child:  Builder(builder: (context) {
            return SizedBox(

              child: ListView.builder(

                padding: EdgeInsets.only(
                  top: context.getHeight(12),
                  bottom: context.getHeight(12),
                ),
                itemCount: items.length,

                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(

                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.getMinSize(14)),
                    ),
                    child: InkWell(
                      onTap: () {
                  
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Tapped ${item['title']}')),
                        );
                      },
                      borderRadius: BorderRadius.circular(context.getMinSize(14)),
                      child: SizedBox(
                        height: context.sizeBuilder.height/2 ,

                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.getWidth(12),
                            vertical: context.getHeight(12),
                          ),
                          child: Row(
                            children: [

                              CircleAvatar(
                                radius: context.getMinSize(28),
                                backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.12),
                                child: Icon(
                                  item['icon'] as IconData,
                                  size: context.getFontSize(20),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),

                              SizedBox(width: context.getWidth(12)),


                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'] as String,
                                      style: TextStyle(
                                        fontSize: context.getFontSize(16),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: context.getHeight(6)),
                                    Text(
                                      item['subtitle'] as String,
                                      style: TextStyle(
                                        fontSize:  context.getFontSize(14),
                                        color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.8),
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: context.getWidth(12)),
                              ElevatedButton(
                                onPressed: () {
                                
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Action for ${item['title']}')),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.getWidth(6),
                                    vertical: context.getHeight(6),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Open',
                                  style: TextStyle(fontSize: context.getFontSize(12)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );

          },),

                ),
      ),);
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
