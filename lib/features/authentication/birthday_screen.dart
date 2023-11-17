import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/authentication/email_screen.dart';
import 'package:tiktokclone/features/authentication/widgets/form_button.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayControl = TextEditingController();

  String _birthday = '';

  @override
  void initState() {
    super.initState();
    _birthdayControl.addListener(() {
      setState(() {
        _birthday = _birthdayControl.text;
      });
    });
  }

  @override
  void dispose() {
    _birthdayControl.dispose();
    super.dispose();
  }

  void onNextTap() {
    if (_birthday.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EmailScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v24,
            const Text(
              'When\'s your birthday?',
              style: TextStyle(
                fontSize: Sizes.size28,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v12,
            Text(
              'Your birthday won\'t be shown publicly.',
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Theme.of(context).hintColor,
              ),
            ),
            Gaps.v24,
            TextField(
              controller: _birthdayControl,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).hintColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
            ),
            Gaps.v24,
            GestureDetector(
              onTap: onNextTap,
              child: FormButton(
                disabled: _birthday.isEmpty,
              ),
            )
          ],
        ),
      ),
    );
  }
}
