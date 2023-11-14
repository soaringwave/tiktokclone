import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v24,
            Text(
              'Create username',
              style: TextStyle(
                fontSize: Sizes.size28,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v12,
            Text(
              'You can always change this later.',
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
