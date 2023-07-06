import 'package:cat_sanctuary/cat_details_page.dart';
import 'package:cat_sanctuary/cat_sanctuary_list_page.dart';
import 'package:cat_sanctuary/cats_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_sanctuary/cat_sanctuary.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedTabIndex = 0;
  late final CatsRepository _catsRepository;
  Future<CatSanctuary>? _catsFuture;

  @override
  void initState() {
    super.initState();
    _catsRepository = RepositoryProvider.of<CatsRepository>(context);
    _catsFuture = _catsRepository.getCatOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTabIndex,
        children: [
          const CatSanctuaryListPage(),
          FutureBuilder<CatSanctuary>(
            future: _catsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                final data = snapshot.data;
                if (data != null) {
                  return CatDetailsPage(cat: data);
                }
              }
              return Text('An error occurred: ${snapshot.error}');
            },
          ),
          Container(
            color: Colors.pinkAccent.shade100,
          ),
          Container(color: Colors.deepPurple.shade50),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(
            () {
              _selectedTabIndex = index;
            },
          );
        },
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Cat List'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Day Cat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner), label: 'Documents'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }
}
