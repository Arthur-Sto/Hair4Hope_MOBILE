import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(
      context,
    ).size.width;
    final double titleFontSize =
        (screenWidth * 0.08).clamp(28.0, 40.0);
    final double subtitleFontSize =
        (screenWidth * 0.045).clamp(16.0, 22.0);
    final double buttonFontSize =
        (screenWidth * 0.045).clamp(16.0, 20.0);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 1),
            Image.asset(
              'assets/images/logo.webp',
              width: screenWidth * 0.6,
            ),
            const Spacer(flex: 2),
            Text(
              'Seja bem vindo!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Vamos ver as possibilidades? Aqui você pode...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: subtitleFontSize,
              ),
            ),
            const Spacer(flex: 3),
            SizedBox(
              width: screenWidth * 0.85,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFFEC2C8F,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed('/presentation');
                },
                child: Text(
                  "Começar",
                  style: TextStyle(
                    fontSize: buttonFontSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
