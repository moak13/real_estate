import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate/app/app.locator.dart';
import 'package:real_estate/app/app.router.dart';
import 'package:real_estate/ui/common/device_scaler.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  _initSystemUI();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
      builder: (context, child) {
        final mQuery = MediaQuery.of(context);
        DeviceScaler().deviceHeight = mQuery.size.height;
        return MediaQuery(
          data: mQuery.copyWith(
            textScaler: TextScaler.linear(min(mQuery.textScaleFactor, 1.4)),
          ),
          child: child!,
        );
      },
    );
  }
}

void _initSystemUI() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
}
