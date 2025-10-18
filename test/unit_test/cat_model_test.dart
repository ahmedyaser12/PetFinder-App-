import 'package:flutter_test/flutter_test.dart';
import 'package:petfinder_app/feature/home/data/model/beard_model.dart';

void main() {
  test('Cat.fromJson should parse correctly', () {
    final json = {
      'id': '1',
      'name': 'Bengal',
      'temperament': 'Active',
      'origin': 'Asia',
      'description': 'Wild look',
      'life_span': '12-15',
      'reference_image_id': 'img123',
      'weight': {'imperial': '10-15', 'metric': '4-7'},
    };

    final cat = Cat.fromJson(json);

    expect(cat.id, '1');
    expect(cat.name, 'Bengal');
    expect(cat.weight?.metric, '4-7');
  });
}
