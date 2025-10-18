import 'package:flutter/cupertino.dart';
import 'package:petfinder_app/app_routing/route_names.dart';
import 'package:petfinder_app/app_routing/routing_data.dart';

import '../feature/nav_bar/presentaion/screen/nav_bar_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var uriData = Uri.parse(settings.name!);

    var routingData = RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );
    // ignore: unused_local_variable
    Map<String, dynamic> parameters = {};

    if (settings.arguments is Map<String, dynamic>) {
      parameters = settings.arguments as Map<String, dynamic>;
    } else if (settings.arguments != null) {
      // Store non-map arguments under a generic key
      parameters['value'] = settings.arguments;
    }

    switch (routingData.route) {
      case RouteNames.bottomNavBar:
        return _getPageRoute(MainScreen(), settings);
      default:
        return _getPageRoute(Container(), settings);
    }
  }
}

Route _getPageRoute(
  Widget child,
  RouteSettings settings, {
  bool? translateFromBottom,
}) {
  return animationSwitch(
    translateFromBottom ?? false,
    destination: child,
    routeName: settings.name!,
  );
}

Route animationSwitch(
  bool translateFromBottom, {
  required Widget destination,
  required String routeName,
}) {
  return CupertinoPageRoute(
    settings: RouteSettings(name: routeName),
    builder: (BuildContext context) => destination,
    fullscreenDialog:
        translateFromBottom, // enables modal transition from bottom
    maintainState: true,
  );
}
