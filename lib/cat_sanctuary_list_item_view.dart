import 'package:cat_sanctuary/cat_sanctuary.dart';
import 'package:flutter/cupertino.dart';

class CatSanctuaryListItemView extends StatelessWidget {
  final CatSanctuary cat;

  const CatSanctuaryListItemView({
    super.key,
    required this.cat,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              cat.imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cat.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    cat.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
