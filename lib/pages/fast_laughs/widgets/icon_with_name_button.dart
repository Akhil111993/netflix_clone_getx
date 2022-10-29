import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconWithNameButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onPressed;

  const IconWithNameButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              text,
              style: GoogleFonts.archivoNarrow(),
            ),
          ),
        ],
      ),
    );
  }
}
