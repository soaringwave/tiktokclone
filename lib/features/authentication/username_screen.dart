import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/authentication/email_screen.dart';
import 'package:tiktokclone/features/authentication/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameControl = TextEditingController();

  String _username = '';

  @override
  void initState() {
    super.initState();
    _usernameControl.addListener(() {
      setState(() {
        _username = _usernameControl.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameControl.dispose();
    super.dispose();
  }

  void onNextTap() {
    if (_username.isNotEmpty) {
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
                color: Theme.of(context).hintColor,
              ),
            ),
            Gaps.v24,
            TextField(
              controller: _usernameControl,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                hintText: 'Username',
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
                disabled: _username.isEmpty,
                text: 'Next',
              ),
            )
          ],
        ),
      ),
    );
  }
}
