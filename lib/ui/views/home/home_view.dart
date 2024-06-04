import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:real_estate/extensions/num_scalar.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';
import 'widgets/widgets.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 80.scale,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xfffaf5ef),
              Color(0xfffad7af),
            ],
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedWidth(
                    duration: 3.seconds,
                    containerWidth: 150,
                  ),
                  CircleAvatar(
                    radius: 30.scale,
                    backgroundImage:
                        const AssetImage('assets/jpg/profile_image.jpg'),
                  ).animate().scale(
                        duration: 5.seconds,
                        curve: Curves.easeInOut,
                      ),
                ],
              ),
            ),
            SizedBox(
              height: 50.scale,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: Text(
                'Hi, Marina',
                style: TextStyle(
                  color: const Color(0xff837c74),
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sf,
                ),
              ).animate().scaleY(),
            ),
            SizedBox(
              height: 8.scale,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: Text(
                'let\'s select your\nperfect place',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.sf,
                ),
              ).animate().scaleY(),
            ),
            SizedBox(
              height: 35.scale,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 150.scale,
                    width: 150.scale,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Color(0xfffc9e12),
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'BUY',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sf,
                          ),
                        ),
                        SizedBox(
                          height: 20.scale,
                        ),
                        AnimatedCountUp(
                          duration: 2.seconds,
                          end: 1034,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 30.sf,
                          ),
                        ),
                        SizedBox(
                          height: 5.scale,
                        ),
                        Text(
                          'offers',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sf,
                          ),
                        ),
                      ],
                    ),
                  ).animate().scale(
                        duration: 3.seconds,
                      ),
                  Container(
                    height: 150.scale,
                    width: 150.scale,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'RENT',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sf,
                          ),
                        ),
                        SizedBox(
                          height: 20.scale,
                        ),
                        AnimatedCountUp(
                          duration: 2.seconds,
                          end: 2212,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 30.sf,
                          ),
                        ),
                        SizedBox(
                          height: 5.scale,
                        ),
                        Text(
                          'offers',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sf,
                          ),
                        ),
                      ],
                    ),
                  ).animate().scale(
                        duration: 3.seconds,
                      ),
                ],
              ),
            ),
            SizedBox(
              height: 35.scale,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 10.scale,
                left: 10,
                right: 10,
                bottom: 10.scale,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return RentalCard(
                    onTap: viewModel.moveToRentalDetails,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10.scale,
                  );
                },
                itemCount: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
