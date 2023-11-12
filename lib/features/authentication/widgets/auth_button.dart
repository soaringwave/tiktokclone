import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final FaIcon icon;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size14,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
        ),
        child: Row(
          children: [
            icon,
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Sizes.size16),
            ),
          ],
        ),
      ),
    );
  }
}
