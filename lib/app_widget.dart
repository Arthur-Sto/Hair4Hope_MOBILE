import 'package:flutter/material.dart';
import 'package:iam_app/pages/home_page.dart';
import 'package:iam_app/pages/welcome_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors
            .white, // Maneira correta de definir a cor de fundo
      ),
      initialRoute: '/', // Inicia na WelcomePage
      routes: {
        '/': (context) => const WelcomePage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
