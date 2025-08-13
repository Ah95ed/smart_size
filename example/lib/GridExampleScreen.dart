import 'package:flutter/material.dart';
import 'package:smart_sizer/smart_sizer.dart';

class GridExampleScreen extends StatelessWidget {
  const GridExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive GridView")),
      backgroundColor: const Color(0xFF80CBC4),
      body: Padding(
        padding: EdgeInsets.all(context.getWidth(12)),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
