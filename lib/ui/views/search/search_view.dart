import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:real_estate/extensions/num_scalar.dart';
import 'package:stacked/stacked.dart';

import 'search_viewmodel.dart';
import 'widgets/widgets.dart';

class SearchView extends StackedView<SearchViewModel> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchViewModel viewModel,
    Widget? child,
  ) {
    final mQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(
                viewModel.currentLocation.lat,
                viewModel.currentLocation.long,
              ),
              zoom: 9.2,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.real_estate',
              ),
              MarkerLayer(
                markers: viewModel.getRandomMarkers,
              ),
              Column(
                children: [
                  SizedBox(
                    height: (50 + mQuery.viewPadding.top).scale,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 15,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Search...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0.scale,
                              ),
                            ),
                          ),
                        ).animate().fadeIn(
                              delay: 2.5.seconds,
                            ),
                        const Spacer(),
                        Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          child: IconButton(
                            onPressed: viewModel.search,
                            tooltip: 'Filter',
                            color: Colors.white,
                            icon: const Icon(
                              Icons.filter_alt_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ).animate().fadeIn(
                              delay: 2.seconds,
                            ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
            top: 630.scale,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    GlassButton(
                      height: 50.scale,
                      width: 50.scale,
                      tooltip: 'Triangulate',
                      onTap: viewModel.triangulate,
                      child: const Icon(
                        CupertinoIcons.layers_alt,
                        color: Colors.white,
                      ),
                    ).animate().fadeIn(
                          delay: 2.seconds,
                        ),
                    SizedBox(
                      height: 5.scale,
                    ),
                    GlassButton(
                      height: 50.scale,
                      width: 50.scale,
                      tooltip: 'Zoom',
                      onTap: viewModel.togglePortal,
                      child: CustomPopUp(
                        items: const [
                          CustomPopItem(
                            icon: Icons.security,
                            text: 'Cosy areas',
                          ),
                          CustomPopItem(
                            icon: Icons.wallet,
                            text: 'Price',
                          ),
                          CustomPopItem(
                            icon: Icons.delete_sweep_rounded,
                            text: 'Infrastructure',
                          ),
                          CustomPopItem(
                            icon: Icons.layers,
                            text: 'Without any layer',
                          ),
                        ],
                        controller: viewModel.controller,
                        currentIndex: viewModel.currentIndex,
                        onTap: viewModel.setIndex,
                        child: const Icon(
                          CupertinoIcons.paperplane,
                          color: Colors.white,
                        ),
                      ),
                    ).animate().fadeIn(
                          delay: 2.seconds,
                        ),
                  ],
                ),
                GlassButton(
                  height: 50.scale,
                  width: 150,
                  tooltip: 'List of variants',
                  onTap: viewModel.listOfVariants,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        CupertinoIcons.text_alignleft,
                        color: Colors.white,
                        size: 15.sf,
                      ),
                      const Spacer(),
                      Text(
                        'List of variants',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sf,
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(
                      delay: 2.seconds,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  SearchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchViewModel();
}
