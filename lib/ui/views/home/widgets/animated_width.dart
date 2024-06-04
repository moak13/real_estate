import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:real_estate/extensions/num_scalar.dart';

class AnimatedWidth extends StatelessWidget {
  final Duration duration;
  final double containerWidth;

  const AnimatedWidth({
    Key? key,
    required this.duration,
    required this.containerWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: containerWidth),
      duration: duration,
      builder: (context, width, child) {
        return Container(
          height: 50.scale,
          width: width,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Color(0xff837c74),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Saint Petersburg',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff837c74),
                  fontSize: 10.sf,
                ),
              ),
            ],
          ).animate(delay: duration).fadeIn(
                duration: 3.seconds,
              ),
        );
      },
    );
  }
}
