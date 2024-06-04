import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:real_estate/extensions/num_scalar.dart';

import 'custom_pop_item.dart';

class CustomPopUp extends StatelessWidget {
  final List<CustomPopItem> items;
  final OverlayPortalController controller;
  final int currentIndex;
  final Widget? child;
  final ValueChanged<int>? onTap;

  const CustomPopUp({
    required this.items,
    required this.controller,
    this.currentIndex = 0,
    this.child,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: controller,
      child: child,
      overlayChildBuilder: (context) {
        return Positioned(
          top: 500.scale,
          right: 170,
          bottom: 110.scale,
          child: Container(
            width: 190,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: List.generate(
                items.length,
                (index) {
                  final item = items.elementAt(index);
                  return CustomPopItem(
                    icon: item.icon,
                    text: item.text,
                    isSelected: currentIndex == index,
                    onTap: () {
                      onTap?.call(index);
                    },
                  );
                },
              ),
            ),
          ),
        ).animate().fadeIn(
              begin: 0,
              curve: Curves.easeInOut,
            );
      },
    );
  }
}
