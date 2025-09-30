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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 150,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/images/fotohome.webp',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            QuickAcess(),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              child: Text(
                'Próximo Evento',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            EventCard(
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
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 115,
              height: 115,
              decoration: BoxDecoration(
                color: Color(0xFFF3E8FF),
                borderRadius:
                    BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.2),
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
                  QuickAccessIcon(
                    icon: Icons
                        .location_on_outlined,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Pontos de Coleta',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 115,
              height: 115,
              decoration: BoxDecoration(
                color: Color(0xFFF3E8FF),
                borderRadius:
                    BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.2),
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
                  SizedBox(height: 8),
                  QuickAccessIcon(
                    icon:
                        Icons.volunteer_activism,
                  ),
                  Text(
                    'Galeria da\nSuperação',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 115,
              height: 115,
              decoration: BoxDecoration(
                color: Color(0xFFF3E8FF),
                borderRadius:
                    BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.2),
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
                  QuickAccessIcon(
                    icon: Icons
                        .monetization_on_outlined,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Doar Dinheiro',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 115,
              height: 115,
              decoration: BoxDecoration(
                color: Color(0xFFF3E8FF),
                borderRadius:
                    BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(
                      0,
                      3,
                    ), // Posição da sombra (horizontal, vertical)
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  QuickAccessIcon(
                    icon:
                        Icons.handshake_outlined,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Voluntariado',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
