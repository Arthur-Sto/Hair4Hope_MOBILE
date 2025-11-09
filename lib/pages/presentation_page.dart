import 'package:flutter/material.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(
      context,
    ).size.width;
    final double subtitleFontSize =
        (screenWidth * 0.045).clamp(16.0, 22.0);
    final double buttonFontSize =
        (screenWidth * 0.045).clamp(16.0, 20.0);

    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.end,
            children: [
              CloseButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed('/home');
                },
              ),
            ],
          ),
          Image.asset(
            'assets/images/logo.webp',
            width: screenWidth * 0.6,
          ),
          const Spacer(flex: 1),
          Icon(
            Icons.location_on,
            size: 135,
            color: const Color.fromARGB(
              255,
              85,
              85,
              85,
            ),
          ),
          Text(
            'Encontrar pontos de coleta proximos de você!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: subtitleFontSize * 1.35,
            ),
          ),
          Text(
            '1/2',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: subtitleFontSize * 0.90,
            ),
          ),
          const Spacer(flex: 2),
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
                ).pushReplacementNamed(
                  '/presentation2',
                );
              },
              child: Text(
                "Prosseguir",
                style: TextStyle(
                  fontSize: buttonFontSize * 1.2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
