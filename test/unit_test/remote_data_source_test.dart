import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:petfinder_app/core/network/exception/server_exception.dart';
import 'package:petfinder_app/core/network/models/api_error_model.dart';
import 'package:petfinder_app/core/network/models/api_success_model.dart';
import 'package:petfinder_app/core/network/network_provider/api_services.dart';
import 'package:petfinder_app/feature/home/data/data/remote_data_sourse.dart';
import 'package:petfinder_app/feature/home/data/model/beard_model.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late MockApiService mockApi;
  late RemoteDataSourse dataSource;

  setUp(() {
    mockApi = MockApiService();
    dataSource = RemoteDataSourse(mockApi);
  });

  test('should return list of cats when response is success', () async {
    final mockData = [
      {'id': '1', 'name': 'Bengal'},
      {'id': '2', 'name': 'Persian'},
    ];

    when(() => mockApi.get(any())).thenAnswer(
      (_) async =>
          Right(ApiSuccessModel(data: mockData, statusCode: 200, message: '')),
    );

    final result = await dataSource.getCats();

    expect(result, isA<List<Cat>>());
    expect(result.length, 2);
  });

  test('should throw ServerException when api fails', () async {
    when(() => mockApi.get(any())).thenAnswer(
      (_) async => Left(ApiFaliureModel(message: 'error', status: 500)),
    );

    expect(
      () async => await dataSource.getCats(),
      throwsA(isA<ServerException>()),
    );
  });
}
