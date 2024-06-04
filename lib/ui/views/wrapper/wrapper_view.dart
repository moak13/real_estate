import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stacked/stacked.dart';

import 'widgets/widgets.dart';
import 'wrapper_viewmodel.dart';

class WrapperView extends StackedView<WrapperViewModel> {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WrapperViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GetIndexView(
            currentIndex: viewModel.currentIndex,
          ),
          CustomBottomNavigationBar(
            items: const [
              CustomBottomNavigationBarItem(
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
                tooltip: 'Search',
              ),
              CustomBottomNavigationBarItem(
                icon: Icon(
                  Icons.message_rounded,
                  color: Colors.white,
                ),
                tooltip: 'Message',
              ),
              CustomBottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  color: Colors.white,
                ),
                tooltip: 'Home',
              ),
              CustomBottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_rounded,
                  color: Colors.white,
                ),
                tooltip: 'Favorite',
              ),
              CustomBottomNavigationBarItem(
                icon: Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                ),
                tooltip: 'Profile',
              ),
            ],
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.setIndex,
          ).animate().slideY(
                begin: 1,
                end: 0,
                duration: 3.seconds,
                curve: Curves.easeIn,
              ),
        ],
      ),
    );
  }

  @override
  WrapperViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WrapperViewModel();
}
