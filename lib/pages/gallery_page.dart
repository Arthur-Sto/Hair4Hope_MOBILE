import 'package:flutter/material.dart';
import 'package:iam_app/components/my_bottom_nav_bar.dart';
import 'package:iam_app/components/myappbar.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        titleText: 'Galeria da Superação',
      ),
      body: Center(
        child: Text(
          'Em breve!!! \n Aqui você poderá ver depoimentos e posts de eventos aqui!',
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(
        currentIndex: 2, // Esta é a página da Galeria (índice 2)
      ),
    );
  }
}
