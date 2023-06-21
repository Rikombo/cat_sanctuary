import 'package:cat_sanctuary/cat_details_page.dart';
import 'package:cat_sanctuary/cat_sanctuary_list_page.dart';
import 'package:flutter/material.dart';

import 'cats.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now().day;
    final index = today % cats.length;
    return Scaffold(
      body: IndexedStack(
        index: _selectedTabIndex,
        children: [
          const CatSanctuaryListPage(),
          CatDetailsPage(cat: cats[index]),
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
