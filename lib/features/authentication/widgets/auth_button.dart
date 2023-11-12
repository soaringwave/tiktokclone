import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size14),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: Sizes.size16),
        ),
      ),
    );
  }
}
