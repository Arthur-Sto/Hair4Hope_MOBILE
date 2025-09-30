import 'package:flutter/material.dart';
import 'package:iam_app/components/myappbar.dart';
import 'package:iam_app/components/event_card.dart';
import 'package:iam_app/components/quick_access_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyAppBar(
        key: key,
        titleText: 'Início',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: ListView(
          // Usar ListView para evitar overflow em telas pequenas
          children: [
            const SizedBox(height: 5),
            DonationCard(),
            const SizedBox(height: 8),
            const QuickAcess(),
            const SizedBox(height: 25),
            Text(
              'Próximo Evento',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const EventCard(
              month: "JUN",
              day: "15",
              title: "Campanha de Doação",
              location: "Shopping Center Norte",
              time: "10h - 18h",
            ),
          ],
        ),
      ),
    );
  }
}

class QuickAcess extends StatelessWidget {
  const QuickAcess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildQuickAccessRow(
          context,
          icon1: Icons.location_on_outlined,
          text1: 'Pontos de Coleta',
          icon2: Icons.volunteer_activism,
          text2: 'Galeria da Superação',
        ),
        const SizedBox(height: 15),
        _buildQuickAccessRow(
          context,
          icon1: Icons.monetization_on_outlined,
          text1: 'Doar Dinheiro',
          icon2: Icons.handshake_outlined,
          text2: 'Voluntariado',
        ),
      ],
    );
  }
  Widget _buildQuickAccessRow(
    BuildContext context, {
    required IconData icon1,
    required String text1,
    required IconData icon2,
    required String text2,
  }) {
    return Row(
      children: [
        const Spacer(flex: 1),
        Flexible(
          flex: 8,
          child: _buildQuickAccessCard(
            icon: icon1,
            text: text1,
          ),
        ),
        const SizedBox(width: 15),
        Flexible(
          flex: 8,
          child: _buildQuickAccessCard(
            icon: icon2,
            text: text2,
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }

  Widget _buildQuickAccessCard({
    required IconData icon,
    required String text,
  }) {
    return AspectRatio(
      aspectRatio:
          1 /
          1, // Garante que o card seja sempre um quadrado
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF3E8FF),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.1,
              ),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            QuickAccessIcon(icon: icon),
            const SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
            Positioned(
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
                    230,
                    71,
                    48,
                    102,
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
