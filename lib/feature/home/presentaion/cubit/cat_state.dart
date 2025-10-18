part of 'cat_cubit.dart';

@immutable
sealed class CatState {}

final class CatInitial extends CatState {}

final class GetBreadLoading extends CatState {}

final class GetBreadSuccess extends CatState {
  final List<Cat> breads;
  GetBreadSuccess({required this.breads});
}

final class GetBreadFailure extends CatState {
  final String message;
  GetBreadFailure({required this.message});
}
