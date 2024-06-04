import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'favorite_viewmodel.dart';

class FavoriteView extends StackedView<FavoriteViewModel> {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FavoriteViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text(
          'Favorite View',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  FavoriteViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FavoriteViewModel();
}
