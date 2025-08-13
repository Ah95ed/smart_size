import 'package:flutter/material.dart';
import 'package:smart_sizer/smart_sizer.dart';

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
    final items = List.generate(
      12,
      (i) => {
        'title': 'Card title ${i + 1}',
        'subtitle': 'This is a brief description of item ${i + 1}.',
        'icon': Icons.widgets,
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Responsive Cards',
          style: TextStyle(fontSize: context.getFontSize(18)),
        ),
      ),
      body: SizedBox(
        height: context.sizeBuilder.height,
        child: SizeBuilder(
          baseSize: Size(250, 250),
          height: context.getMinSize(250),
          width: context.getMinSize(250),
          child: Builder(
            builder: (context) {
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
                        borderRadius: BorderRadius.circular(
                          context.getMinSize(14),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Tapped ${item['title']}')),
                          );
                        },
                        borderRadius: BorderRadius.circular(
                          context.getMinSize(14),
                        ),
                        child: SizedBox(
                          height: context.sizeBuilder.height / 2,

                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.getWidth(12),
                              vertical: context.getHeight(12),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: context.getMinSize(28),
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.primary.withOpacity(0.12),
                                  child: Icon(
                                    item['icon'] as IconData,
                                    size: context.getFontSize(20),
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                ),

                                SizedBox(width: context.getWidth(12)),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          fontSize: context.getFontSize(14),
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.color
                                              ?.withOpacity(0.8),
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
                                      SnackBar(
                                        content: Text(
                                          'Action for ${item['title']}',
                                        ),
                                      ),
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
                                    style: TextStyle(
                                      fontSize: context.getFontSize(12),
                                    ),
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
            },
          ),
        ),
      ),
    );
  }
}
