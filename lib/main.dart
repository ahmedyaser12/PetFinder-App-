import 'package:flutter/material.dart';

import 'app_routing/app_router.dart';
import 'app_routing/route_names.dart';
import 'core/services/navigation_service.dart';
import 'core/services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupSingeltonServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: RouteNames.bottomNavBar,
      debugShowCheckedModeBanner: false,
      navigatorKey: getIt<NavigationService>().navigatorKey,
    );
  }
}
