import 'package:auto_route/auto_route.dart';
import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:pots_trackr/app/router.gr.dart' as MyRouter;
import 'package:pots_trackr/app/locator.dart';
import 'package:pots_trackr/core/services/analytics_service.dart';
import 'package:pots_trackr/app/logger.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  Catcher(MyApp(),
      debugConfig: Logger.debugOptions,
      releaseConfig: Logger.releaseOptions,
      navigatorKey: locator<NavigationService>().navigatorKey);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Pots Tracker',
        builder: ExtendedNavigator<MyRouter.Router>(
          router: MyRouter.Router(),
          navigatorKey: locator<NavigationService>().navigatorKey,
          initialRoute: MyRouter.Routes.startUpView,
          observers: [locator<AnalyticsService>().getAnalyticsObserver()],
        ),
      );
}
