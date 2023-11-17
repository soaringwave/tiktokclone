import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    required this.text,
  });

  final bool disabled;
  final String text;

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
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
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
              color: disabled ? Theme.of(context).hintColor : Colors.white,
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w600,
            ),
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }
}
