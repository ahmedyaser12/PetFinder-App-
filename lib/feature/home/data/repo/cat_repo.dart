import 'package:dartz/dartz.dart';

import '../../../../core/network/exception/server_exception.dart';
import '../../../../core/network/models/api_error_model.dart';
import '../data/remote_data_sourse.dart';
import '../model/beard_model.dart';

class CatRepo {
  final RemoteDataSourse _dataSourse;

  CatRepo(this._dataSourse);

  Future<Either<ApiFaliureModel, List<Cat>>> getBreads() async {
    try {
      final result = await _dataSourse.getCats();
      return Right(result);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
