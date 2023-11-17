import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/authentication/password_screen.dart';
import 'package:tiktokclone/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailControl = TextEditingController();

  String _email = '';

  @override
  void initState() {
    super.initState();
    _emailControl.addListener(() {
      setState(() {
        _email = _emailControl.text;
      });
    });
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) return 'Email not valid';
    return null;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onNextTap() {
    if (_isEmailValid() != null || _email.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
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
                'What is your email?',
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v24,
              TextField(
                onEditingComplete: _onNextTap,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: _emailControl,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  errorText: _isEmailValid(),
                  hintText: 'Email',
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
                onTap: _onNextTap,
                child: FormButton(
                  disabled: _email.isEmpty || _isEmailValid() != null,
                  text: 'Next',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
