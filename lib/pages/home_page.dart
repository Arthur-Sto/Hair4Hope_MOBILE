import 'package:flutter/material.dart';
import 'package:iam_app/components/donation_card.dart';
import 'package:iam_app/components/myappbar.dart';
import 'package:iam_app/components/event_card.dart';
import 'package:iam_app/components/quick_access.dart';

class HomePage extends StatelessWidget {
  // Função para solicitar navegação para a MainPage
  final Function(int index)? onNavigate;

  const HomePage({super.key, this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(titleText: 'Início'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: ListView(
          // Usar ListView para evitar overflow em telas pequenas
          children: [
            const SizedBox(height: 5),
            const DonationCard(),
            const SizedBox(height: 8),
            QuickAcess(
              onNavigate:
                  onNavigate ?? (index) {},
            ),
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
