import 'package:flutter/material.dart';
import 'package:pots_trackr/ui/shared/app_colors.dart';

class TextLink extends StatelessWidget {
  final String text;
  final Function onPressed;
  const TextLink(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Text(text,
            style: TextStyle(
                color: darkText, fontWeight: FontWeight.w700, fontSize: 14)),
      );
}
