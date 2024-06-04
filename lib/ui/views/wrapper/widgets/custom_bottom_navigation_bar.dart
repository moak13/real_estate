import 'package:flutter/material.dart';
import 'package:real_estate/extensions/num_scalar.dart';

import 'custom_bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<CustomBottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  const CustomBottomNavigationBar({
    super.key,
    required this.items,
    this.currentIndex = 2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final mQuery = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: (mQuery.viewPadding.bottom + 10).scale,
      ),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          items.length,
          (index) {
            final item = items.elementAt(index);
            return CustomBottomNavigationBarItem(
              icon: item.icon,
              tooltip: item.tooltip,
              isSelected: currentIndex == index,
              onTap: () {
                onTap?.call(index);
              },
            );
          },
        ),
      ),
    );
  }
}
