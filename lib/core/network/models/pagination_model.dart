import 'package:equatable/equatable.dart';

class PaginationModel extends Equatable {
  final num? currentPage;
  final num? lastPage;
  final num? perPage;
  final num? total;
  final num? from;
  final num? to;

  const PaginationModel({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
    this.from,
    this.to,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      currentPage: json['current_page'] ?? json['pageNumber'],
      lastPage: json['last_page'] ?? json['totalPages'],
      perPage: json['per_page'] ?? json['pageSize'],
      total: json['total'] ?? json['totalCount'],
      from: json['from'],
      to: json['to'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': currentPage,
      'per_page': perPage,
    };
  }

  PaginationModel copyWith({
    num? currentPage,
    num? lastPage,
    num? perPage,
    num? total,
    num? from,
    num? to,
  }) {
    return PaginationModel(
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  List<Object?> get props => [
    currentPage,
    lastPage,
    perPage,
    total,
    from,
    to,
  ];
}