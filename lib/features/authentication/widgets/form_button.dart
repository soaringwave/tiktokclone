import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.abled,
  });

  final bool abled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 500,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: abled ? Theme.of(context).primaryColor : Colors.grey.shade300,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size12,
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(
              milliseconds: 500,
            ),
            style: TextStyle(
              color: abled ? Colors.white : Theme.of(context).hintColor,
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w600,
            ),
            child: const Text(
              'Next',
            ),
          ),
        ),
      ),
    );
  }
}
