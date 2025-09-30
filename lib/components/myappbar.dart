import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String titleText;
  const MyAppBar({
    super.key,
    required this.titleText,
  });

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(
      context,
    ).size.width;
    final double responsiveTitleSize =
        (screenWidth * 0.05).clamp(16.0, 22.0);
    final double responsiveIconSize =
        (screenWidth * 0.065).clamp(22.0, 32.0);

    return AppBar(
      title: Text(titleText),
      shape: Border(
        bottom: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: responsiveTitleSize,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          iconSize: responsiveIconSize,
          icon: const Icon(
            Icons.person_outline,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        IconButton(
          iconSize: responsiveIconSize,
          icon: const Icon(
            Icons.settings_outlined,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
