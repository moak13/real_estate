import 'package:flutter/material.dart';
import 'package:real_estate/extensions/num_scalar.dart';

class CustomPopItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const CustomPopItem({
    super.key,
    required this.icon,
    required this.text,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isSelected,
      visualDensity: VisualDensity.compact,
      leading: Icon(
        icon,
        color: Colors.grey,
        size: 20.sf,
      ),
      onTap: onTap,
      selectedColor: Colors.orange,
      title: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.orange : Colors.grey,
          fontSize: 13.5.sf,
        ),
      ),
    );
  }
}
