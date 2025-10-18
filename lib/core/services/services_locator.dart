import 'package:get_it/get_it.dart';

import '../network/network_provider/api_services.dart';
import '../network/network_provider/dio_api_service_impl.dart';
import 'navigation_service.dart';

GetIt getIt = GetIt.instance;

setupSingeltonServices() async {
  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerSingleton<ApiService>(DioApiServiceImpl());
}
