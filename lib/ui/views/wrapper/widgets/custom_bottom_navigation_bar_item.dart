import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final Widget icon;
  final bool isSelected;
  final String? tooltip;
  final VoidCallback? onTap;
  const CustomBottomNavigationBarItem({
    super.key,
    required this.icon,
    this.isSelected = false,
    this.tooltip,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orangeAccent,
        ),
        child: Tooltip(
          message: tooltip,
          child: icon,
        ),
      );
    }
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      child: Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: onTap,
          child: icon,
        ),
      ),
    );
  }
}
