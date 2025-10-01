import 'package:flutter/material.dart';
import 'package:iam_app/components/quick_access_icon.dart';

class QuickAcess extends StatelessWidget {
  final Function(int index) onNavigate;

  const QuickAcess({
    super.key,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildQuickAccessRow(
          context,
          icon1: Icons.location_on_outlined,
          text1: 'Pontos de Coleta',
          onTap1: () => onNavigate(
            0,
          ), // Navega para o índice 0
          icon2: Icons.volunteer_activism,
          text2: 'Galeria da Superação',
          onTap2: () => onNavigate(
            2,
          ), // Navega para o índice 2
        ),
        const SizedBox(height: 15),
        _buildQuickAccessRow(
          context,
          icon1: Icons.monetization_on_outlined,
          text1: 'Doar Dinheiro',
          onTap1: () {
            // Ação para Doar Dinheiro
          },
          icon2: Icons.handshake_outlined,
          text2: 'Voluntariado',
          onTap2: () {
            // Ação para Voluntariado
          },
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
    required VoidCallback onTap1,
    required VoidCallback onTap2,
  }) {
    return Row(
      children: [
        const Spacer(flex: 1),
        Flexible(
          flex: 8,
          child: _buildQuickAccessCard(
            icon: icon1,
            text: text1,
            onTap: onTap1,
          ),
        ),
        const SizedBox(width: 15),
        Flexible(
          flex: 8,
          child: _buildQuickAccessCard(
            icon: icon2,
            text: text2,
            onTap: onTap2,
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }

  Widget _buildQuickAccessCard({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio:
            1 /
            1, // Garante que o card seja sempre um quadrado
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF3E8FF),
            borderRadius: BorderRadius.circular(
              10,
            ),
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
      ),
    );
  }
}
