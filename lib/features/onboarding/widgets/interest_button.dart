import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiktokclone/constants/sizes.dart';

class InterestButton extends StatelessWidget {
  const InterestButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size32,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 3,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size16,
          vertical: Sizes.size14,
        ),
        child: Text(
          interest,
          style: const TextStyle(
            fontSize: Sizes.size20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
