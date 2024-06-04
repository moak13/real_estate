import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:real_estate/app/app.locator.dart';
import 'package:real_estate/data_models/location.dart';
import 'package:real_estate/extensions/num_scalar.dart';
import 'package:real_estate/services/map_box_service.dart';
import 'package:stacked/stacked.dart';

import 'widgets/custom_marker.dart';

class SearchViewModel extends BaseViewModel with IndexTrackingStateHelper {
  final _mapBoxService = locator<MapBoxService>();

  late Location currentLocation;

  final OverlayPortalController controller = OverlayPortalController();

  SearchViewModel() {
    currentLocation = _mapBoxService.current;
  }

  List<Location> get _getRandomLocations {
    List<Location> locations = [];
    for (int i = 0; i < 6; i++) {
      final result = _mapBoxService.pointInCircle(currentLocation, 25);
      locations.add(result);
    }
    return locations;
  }

  List<Marker> get getRandomMarkers {
    return List<Marker>.from(
      _getRandomLocations.map(
        (e) => Marker(
          height: 35.scale,
          width: 35.scale,
          point: LatLng(e.lat, e.long),
          builder: (context) {
            return const CustomMarker();
          },
        ),
      ),
    );
  }

  void search() {}

  void listOfVariants() {}

  void togglePortal() {
    controller.toggle();
  }

  void triangulate() {}
}
