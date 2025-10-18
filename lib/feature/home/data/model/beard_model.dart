class Cat {
  final String id;
  final String name;
  final String? temperament;
  final String? origin;
  final String? description;
  final String? lifeSpan;
  final String? referenceImageId;
  final Weight? weight;

  Cat({
    required this.id,
    required this.name,
    this.temperament,
    this.origin,
    this.description,
    this.lifeSpan,
    this.referenceImageId,
    this.weight,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      temperament: json['temperament'],
      origin: json['origin'],
      description: json['description'],
      lifeSpan: json['life_span'],
      referenceImageId: json['reference_image_id'],
      weight: json['weight'] != null ? Weight.fromJson(json['weight']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'temperament': temperament,
      'origin': origin,
      'description': description,
      'life_span': lifeSpan,
      'reference_image_id': referenceImageId,
      'weight': weight?.toJson(),
    };
  }
}

class Weight {
  final String? imperial;
  final String? metric;

  Weight({this.imperial, this.metric});

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(imperial: json['imperial'], metric: json['metric']);
  }

  Map<String, dynamic> toJson() {
    return {'imperial': imperial, 'metric': metric};
  }
}
