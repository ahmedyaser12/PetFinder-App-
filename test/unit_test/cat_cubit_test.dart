import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:petfinder_app/core/network/models/api_error_model.dart';
import 'package:petfinder_app/feature/home/data/model/beard_model.dart';
import 'package:petfinder_app/feature/home/data/repo/cat_repo.dart';
import 'package:petfinder_app/feature/home/presentaion/cubit/cat_cubit.dart';

class MockCatRepo extends Mock implements CatRepo {}

void main() {
  late MockCatRepo mockRepo;
  late CatCubit cubit;

  setUp(() {
    mockRepo = MockCatRepo();
    cubit = CatCubit(mockRepo);
  });

  blocTest<CatCubit, CatState>(
    'emits [GetBreadLoading, GetBreadSuccess] when getBreads succeeds',
    build: () {
      when(
        () => mockRepo.getBreads(),
      ).thenAnswer((_) async => Right([Cat(id: '1', name: 'Bengal')]));
      return cubit;
    },
    act: (cubit) => cubit.getBreads(),
    expect: () => [isA<GetBreadLoading>(), isA<GetBreadSuccess>()],
  );

  blocTest<CatCubit, CatState>(
    'emits [GetBreadLoading, GetBreadFailure] when getBreads fails',
    build: () {
      when(() => mockRepo.getBreads()).thenAnswer(
        (_) async => Left(ApiFaliureModel(message: 'Error', status: 500)),
      );
      return cubit;
    },
    act: (cubit) => cubit.getBreads(),
    expect: () => [isA<GetBreadLoading>(), isA<GetBreadFailure>()],
  );
}
