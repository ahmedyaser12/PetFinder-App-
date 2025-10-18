import 'package:equatable/equatable.dart';
import 'package:petfinder_app/core/network/models/pagination_model.dart';

class PaginatedResponseModel<T> extends Equatable {
  final List<T> data;
  final PaginationModel pagination;

  const PaginatedResponseModel({required this.data, required this.pagination});

  @override
  List<Object?> get props => [data, pagination];
}
