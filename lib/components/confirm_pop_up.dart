import 'package:flutter/material.dart';

class ConfirmPopUp extends StatelessWidget {
  const ConfirmPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: const Text(
        'Pular Introdução',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        'Tem certeza que deseja pular a introdução?',
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: const Color(
              0xFFEC2C8F,
            ),
          ),
          child: const Text('Sim'),
          onPressed: () {
            Navigator.of(
              context,
            ).pushReplacementNamed('/home');
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(
              0xFFEC2C8F,
            ), // Fundo azul
            foregroundColor:
                Colors.white, // Texto branco
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30.0,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
          ),
          child: const Text('Não'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}