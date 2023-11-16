import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/authentication/password_screen.dart';
import 'package:tiktokclone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordControl = TextEditingController();

  String _password = '';

  @override
  void initState() {
    super.initState();
    _passwordControl.addListener(() {
      setState(() {
        _password = _passwordControl.text;
      });
    });
  }

  String? _isPasswordValid() {
    if (_password.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_password)) return 'Email not valid';
    return null;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onNextTap() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const PasswordScreenn(),
    //   ),
    // );
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
                'Create Password',
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v24,
              TextField(
                onEditingComplete: _onNextTap,
                autocorrect: false,
                controller: _passwordControl,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  errorText: _isPasswordValid(),
                  hintText: 'Make it strong',
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
                  disabled: _password.isEmpty || _isPasswordValid() != null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
