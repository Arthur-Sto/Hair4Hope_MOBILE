import 'package:flutter/material.dart';
import 'package:iam_app/components/UnderDev_pop_up.dart';
import 'package:showcaseview/showcaseview.dart';

class MyAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String titleText;
  final List<GlobalKey> showcaseKeys;
  const MyAppBar({
    super.key,
    required this.titleText,
    required this.showcaseKeys,
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
            Icons.help_outline,
            color: Colors.black87,
          ),
          onPressed: () {
                WidgetsBinding.instance
                    .addPostFrameCallback(
                      (_) => ShowcaseView.get()
                          .startShowCase(
                            showcaseKeys,
                          ),
                    );
          },
        ),
        IconButton(
          iconSize: responsiveIconSize,
          icon: const Icon(
            Icons.person_outline,
            color: Colors.black87,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const UnderDevPopUp();
              },
            );
          },
        ),
        IconButton(
          iconSize: responsiveIconSize,
          icon: const Icon(
            Icons.settings_outlined,
            color: Colors.black87,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const UnderDevPopUp();
              },
            );
          },
        ),
      ],
    );
  }
}
