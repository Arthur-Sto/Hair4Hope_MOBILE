import 'package:flutter/material.dart';

class DonationCard extends StatelessWidget {
  const DonationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Imagem de fundo (assets)
            Image.asset(
              "assets/images/fotohome.webp",
              fit: BoxFit.cover,
              width: double.infinity,
              height: 180,
            ),
            Container(
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.1),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
              },
              child: Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                      255,
                      173,
                      7,
                      93,
                    ),
                    borderRadius:
                        BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Ver amorímetro",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    "Faça a diferença",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Sua doação pode transformar a vida\n"
                    "de quem luta contra o câncer",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class AmorimetroPopUp extends StatelessWidget {
//   const AmorimetroPopUp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const PopupMenuItem(
//       child: Column(
//         children: [Text("Pessoas ajudadas!")],
//       ),
//     );
//   }
// }

//arrumarisso