import 'package:get_it/get_it.dart';
import 'package:petfinder_app/feature/home/data/repo/cat_repo.dart';
import 'package:petfinder_app/feature/home/presentaion/cubit/cat_cubit.dart';

import '../../feature/home/data/data/remote_data_sourse.dart';
import '../network/network_provider/api_services.dart';
import '../network/network_provider/dio_api_service_impl.dart';
import 'navigation_service.dart';

GetIt getIt = GetIt.instance;

setupSingeltonServices() async {
  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerSingleton<ApiService>(DioApiServiceImpl());
  _home();
}

_home() {
  getIt.registerSingleton<RemoteDataSourse>(RemoteDataSourse(getIt()));
  getIt.registerSingleton<CatRepo>(CatRepo(getIt()));
  getIt.registerFactory<CatCubit>(() => CatCubit(getIt()));
}
