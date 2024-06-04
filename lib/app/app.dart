import 'package:real_estate/ui/views/home/home_view.dart';
import 'package:real_estate/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:real_estate/ui/views/wrapper/wrapper_view.dart';
import 'package:real_estate/ui/views/search/search_view.dart';
import 'package:real_estate/ui/views/favorite/favorite_view.dart';
import 'package:real_estate/ui/views/profile/profile_view.dart';
import 'package:real_estate/ui/views/chat/chat_view.dart';
import 'package:real_estate/services/map_box_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: WrapperView),
    AdaptiveRoute(page: HomeView),
    AdaptiveRoute(page: SearchView),
    AdaptiveRoute(page: FavoriteView),
    AdaptiveRoute(page: ProfileView),
    AdaptiveRoute(page: ChatView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: MapBoxService),
// @stacked-service
  ],
)
class App {}
