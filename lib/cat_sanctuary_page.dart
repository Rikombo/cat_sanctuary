import 'package:flutter/material.dart';

import 'package:cat_sanctuary/cat_sanctuary.dart';

class CatSanctuaryPage extends StatelessWidget {
  final CatSanctuary cat;

  const CatSanctuaryPage({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 9),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
