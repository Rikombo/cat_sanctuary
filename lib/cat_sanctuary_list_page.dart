import 'package:cat_sanctuary/cat_sanctuary.dart';
import 'package:cat_sanctuary/cat_sanctuary_list_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cat_sanctuary_page.dart';
import 'cats.dart';

class CatSanctuaryListPage extends StatelessWidget {
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
            onTap: () => _showMovieDetails(context, cats[index]),
            child: CatSanctuaryListItemView(
              cat: cats[index],
            ),
          );
        },
        itemCount: cats.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final today = DateTime.now().day;
          final index = today % cats.length;
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CatSanctuaryPage(cat: cats[index]),
          ));
        },
        child: Icon(Icons.favorite),
        backgroundColor: Colors.brown,
      ),
    );
  }

  void _showMovieDetails(BuildContext context, CatSanctuary cat) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CatSanctuaryPage(cat: cat),
      ),
    );
  }
}
