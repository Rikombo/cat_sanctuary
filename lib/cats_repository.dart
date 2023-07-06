import 'package:cat_sanctuary/cat_sanctuary.dart';

abstract class CatsRepository {
  Future<List<CatSanctuary>> getCats();
  Future<List<CatSanctuary>> searchCats(String query);
  Future<CatSanctuary> getCatOfTheDay();
}