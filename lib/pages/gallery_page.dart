import 'package:flutter/material.dart';
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
          'Página da Galeria da Superação',
        ),
      ),
    );
  }
}
