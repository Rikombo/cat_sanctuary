import 'package:cat_sanctuary/cat_sanctuary.dart';
import 'package:cat_sanctuary/cats_repository.dart';

import 'package:cat_sanctuary/cats.dart';

class InMemoryCatsRepository extends CatsRepository {
  final List<CatSanctuary> catsData = cats;

  @override
  Future<CatSanctuary> getCatOfTheDay() async {
    final today = DateTime.now().day;
    final index = today % cats.length;
    return cats[index];
  }

  @override
  Future<List<CatSanctuary>> getCats() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return catsData;
  }

  @override
  Future<List<CatSanctuary>> searchCats(String query) async {
    return catsData.where((catsData) => catsData.name.contains(query)).toList();
  }
}
