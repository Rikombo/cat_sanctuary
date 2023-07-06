import 'dart:async';

import 'package:cat_sanctuary/cat_details_page.dart';
import 'package:cat_sanctuary/cat_sanctuary.dart';
import 'package:cat_sanctuary/cat_sanctuary_list_item_view.dart';
import 'package:cat_sanctuary/cats_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatSanctuaryListPage extends StatefulWidget {
  const CatSanctuaryListPage({super.key});

  @override
  State<CatSanctuaryListPage> createState() => _CatSanctuaryListPageState();
}

class _CatSanctuaryListPageState extends State<CatSanctuaryListPage> {
  late final CatsRepository catsRepository;
  Future<List<CatSanctuary>>? catsFuture;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debouncer;

  void _debounceSearch() {
    if (_debouncer != null) {
      _debouncer?.cancel();
    }
    _debouncer = Timer(const Duration(seconds: 2), () {
      final query = _searchController.text;
      setState(() {
        catsFuture = catsRepository.searchCats(query);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    catsRepository = RepositoryProvider.of<CatsRepository>(context);
    catsFuture = catsRepository.getCats();
    _searchController.addListener(_debounceSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debouncer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Cats'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search for cats...',
            ),
          ),
          Expanded(
            child: FutureBuilder<List<CatSanctuary>>(
              future: catsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('An error occurred: ${snapshot.error}'),
                  );
                } else {
                  final cats = snapshot.data ?? [];
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _showCatDetails(context, cats[index]),
                        child: CatSanctuaryListItemView(
                          cat: cats[index],
                        ),
                      );
                    },
                    itemCount: cats.length,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showCatDetails(BuildContext context, CatSanctuary cat) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CatDetailsPage(cat: cat),
      ),
    );
  }
}
