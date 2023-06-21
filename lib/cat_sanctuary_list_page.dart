import 'package:cat_sanctuary/cat_details_page.dart';
import 'package:cat_sanctuary/cat_sanctuary.dart';
import 'package:cat_sanctuary/cat_sanctuary_list_item_view.dart';
import 'package:flutter/material.dart';
import 'package:cat_sanctuary/cat_sanctuary_page.dart';
import 'package:cat_sanctuary/cats.dart';

class CatSanctuaryListPage extends StatelessWidget {
  const CatSanctuaryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Cats'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _showCatDetails(context, cats[index]),
            child: CatSanctuaryListItemView(
              cat: cats[index],
            ),
          );
        },
        itemCount: cats.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CatSanctuaryPage(
                cats: cats,
              ),
            ),
          );
        },
        backgroundColor: Colors.brown,
        child: const Icon(
          Icons.favorite,
        ),
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
