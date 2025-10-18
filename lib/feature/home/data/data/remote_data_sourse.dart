import '../../../../core/network/api_constants.dart';
import '../../../../core/network/exception/server_exception.dart';
import '../../../../core/network/network_provider/api_services.dart';
import '../model/beard_model.dart';

class RemoteDataSourse {
  ApiService apiService;

  RemoteDataSourse(this.apiService);

  Future<List<Cat>> getCats() async {
    final response = await apiService.get(ApiConstants.beards);
    return (response.fold(
              (l) => throw ServerException(errorModel: l),
              (r) => r.data,
            )
            as List)
        .map((e) => Cat.fromJson(e))
        .toList();
  }
}
