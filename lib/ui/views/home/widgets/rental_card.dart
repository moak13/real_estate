import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:real_estate/extensions/num_scalar.dart';

class RentalCard extends StatelessWidget {
  final VoidCallback? onTap;
  const RentalCard({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.scale,
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: AssetImage('assets/jpg/apartment.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(25),
          child: Ink(
            padding: EdgeInsets.only(
              top: 150.scale,
              left: 19,
              right: 20,
              bottom: 15.scale,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Spacer(),
                      Text(
                        'Gladkova St., 25',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sf,
                        ),
                      ).animate().fadeIn(
                            duration: 700.milliseconds,
                            curve: Curves.easeInOut,
                          ),
                      const Spacer(),
                      Container(
                        height: 50.scale,
                        width: 50.scale,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 10,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 12.sf,
                        ),
                      ).animate().slideX(
                            begin: -6,
                            end: 0,
                            duration: 500.milliseconds,
                            curve: Curves.easeInOut,
                          )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
