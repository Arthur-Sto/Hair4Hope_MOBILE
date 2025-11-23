import 'package:flutter/material.dart';

class UnderDevPopUp extends StatelessWidget {
  const UnderDevPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/underdev.png'),
          Text(
            'Está área ainda está sendo preparada com carinho, volte em breve!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // fontSize: 13.2,
            ),
          ),
        ],
      )
    );
  }
}