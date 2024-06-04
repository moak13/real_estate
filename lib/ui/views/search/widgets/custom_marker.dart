import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:real_estate/extensions/num_scalar.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
          bottomLeft: Radius.circular(2),
        ),
      ),
      child: Icon(
        Icons.business,
        color: Colors.white,
        size: 20.sf,
      ),
    ).animate().scaleX(
          curve: Curves.easeInOut,
        );
  }
}
