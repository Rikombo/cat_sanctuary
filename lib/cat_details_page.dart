import 'package:cat_sanctuary/cat_sanctuary.dart';
import 'package:flutter/material.dart';

class CatDetailsPage extends StatefulWidget {
  const CatDetailsPage({Key? key, required this.cat}) : super(key: key);
  final CatSanctuary cat;

  @override
  State<CatDetailsPage> createState() => _CatDetailsPageState();
}

class _CatDetailsPageState extends State<CatDetailsPage> {
  var _isAdopted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          widget.cat.name,
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Center(
                  child: Image.network(
                    widget.cat.imageUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.cat.description,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                color: Colors.red,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              height: 64,
              width: 256,
              padding: const EdgeInsets.only(bottom: 16),
              child: _isAdopted
                  ? const Text(
                      'This cat has a family now!',
                      style: TextStyle(fontSize: 20, color: Colors.brown),
                    )
                  : SizedBox(
                      width: 256,
                      height: 64,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            width: 1,
                            color: Colors.brown,
                          ),
                        ),
                        onPressed: () => setState(
                          () {
                            _isAdopted = true;
                          },
                        ),
                        child: const Text(
                          'Adopt',
                          style: TextStyle(fontSize: 24, color: Colors.brown),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
