import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AnimatedCrossFade(
          firstChild: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v20,
                Text(
                  'Choose your interests',
                  style: TextStyle(
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v10,
                Text(
                  'This is a tutorial page.',
                  style: TextStyle(
                    fontSize: Sizes.size20,
                  ),
                ),
              ],
            ),
          ),
          secondChild: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v20,
                Text(
                  'Follow the rules',
                  style: TextStyle(
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v10,
                Text(
                  'This is a tutorial page.',
                  style: TextStyle(
                    fontSize: Sizes.size20,
                  ),
                ),
              ],
            ),
          ),
          crossFadeState: CrossFadeState.showFirst,
          duration: Duration(milliseconds: 500),
        ),
      ),
    );
  }
}
