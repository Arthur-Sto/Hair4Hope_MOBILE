import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const MyBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    // Mapeia o índice do item para a rota correspondente
    const routes = [
      '/collection_points', // Índice 0
      '/home',             // Índice 1
      '/gallery',          // Índice 2
    ];

    void onItemTapped(int index) {
      // Evita navegar para a mesma página
      if (index != currentIndex) {
        Navigator.pushReplacementNamed(context, routes[index]);
      }
    }

    return BottomNavigationBar(
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
      currentIndex: currentIndex,
      selectedItemColor: const Color(
        0xFFEC2C8F,
      ),
      onTap: onItemTapped,
    );
  }
}