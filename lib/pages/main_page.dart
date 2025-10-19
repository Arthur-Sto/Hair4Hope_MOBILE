import 'package:flutter/material.dart';
import 'package:iam_app/pages/collection_points_page.dart';
import 'package:iam_app/pages/gallery_page.dart';
import 'package:iam_app/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() =>
      _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex =
      1; // Começa na tela Home (índice 1)

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      // Passa a função para a página de Pontos de Coleta
      const CollectionPointsPage(),
      // Passa a função para a HomePage
      HomePage(onNavigate: _onItemTapped),
      const GalleryPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_library_outlined,
            ),
            label: 'Galeria',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(
          0xFFEC2C8F,
        ),
        onTap: _onItemTapped,
      ),
    );
  }
}
