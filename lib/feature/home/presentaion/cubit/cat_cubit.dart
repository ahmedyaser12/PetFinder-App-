import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/beard_model.dart';
import '../../data/repo/cat_repo.dart';

part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final CatRepo catRepo;

  CatCubit(this.catRepo) : super(CatInitial());

  Future<void> getBreads() async {
    emit(GetBreadLoading());
    final result = await catRepo.getBreads();
    result.fold(
      (l) => emit(GetBreadFailure(message: l.message)),
      (r) => emit(GetBreadSuccess(breads: r)),
    );
  }
}
