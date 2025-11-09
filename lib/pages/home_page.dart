import 'package:flutter/material.dart';
import 'package:iam_app/components/donation_card.dart';
import 'package:iam_app/components/my_bottom_nav_bar.dart';
import 'package:iam_app/components/myappbar.dart';
import 'package:iam_app/components/event_card.dart';
import 'package:iam_app/components/quick_access.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(titleText: 'Início'),
      body:  Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: ListView(
            children: [
              const SizedBox(height: 5),
              const DonationCard(),
              const SizedBox(height: 8),
              const QuickAcess(),
              const SizedBox(height: 25),
              const Text(
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
      bottomNavigationBar: const MyBottomNavBar(
        currentIndex: 1,
      ),
    );
  }
}
