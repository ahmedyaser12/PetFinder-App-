import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:petfinder_app/core/network/exception/server_exception.dart';
import 'package:petfinder_app/core/network/models/api_error_model.dart';
import 'package:petfinder_app/feature/home/data/data/remote_data_sourse.dart';
import 'package:petfinder_app/feature/home/data/model/beard_model.dart';
import 'package:petfinder_app/feature/home/data/repo/cat_repo.dart';

class MockRemoteDataSource extends Mock implements RemoteDataSourse {}

void main() {
  late CatRepo repo;
  late MockRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockRemoteDataSource();
    repo = CatRepo(mockDataSource);
  });
  test('should return list of cats when successful', () async {
    final cats = [Cat(id: '1', name: 'Bengal')];
    when(() => mockDataSource.getCats()).thenAnswer((_) async => cats);

    final result = await repo.getBreads();

    expect(result, Right(cats));
  });
  test('should return ServerException when api fails', () async {
    final error = ApiFaliureModel(message: 'Server Error', status: 500);
    when(() => mockDataSource.getCats()).thenAnswer(
      (_) => throw ServerException(
        errorModel: ApiFaliureModel(message: error.message, status: 500),
      ),
    );
    final result = await repo.getBreads();
    expect(result, Left(error));
  });
}
