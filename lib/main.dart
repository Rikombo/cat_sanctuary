import 'package:cat_sanctuary/in_memory_cats_repository.dart';
import 'package:cat_sanctuary/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cat_sanctuary/cats_repository.dart';

void main() {
  final catsRepository = InMemoryCatsRepository();
  final catsRepositoryProvider =
      RepositoryProvider<CatsRepository>(create: (context) => catsRepository);
  runApp(
    MultiRepositoryProvider(
      providers: [catsRepositoryProvider],
      child: const MaterialApp(
        home: MainPage(),
      ),
    ),
  );
}
