import 'package:flutter/material.dart';

import 'package:cat_sanctuary/cat_sanctuary.dart';

class CatSanctuaryPage extends StatelessWidget {
  final List<CatSanctuary> cats;

  const CatSanctuaryPage({super.key, required this.cats});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now().day;
    final index = today % cats.length;
    final cat = cats[index];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          cat.name,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Center(
              child: Image.network(
                cat.imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              cat.description,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
