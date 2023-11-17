import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/authentication/widgets/form_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onLoginSubmitted() {
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      return 'Email invalid';
                    },
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
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
                  Gaps.v12,
                  TextFormField(
                    validator: (value) {
                      return 'Password Invalid';
                    },
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Password',
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
                ],
              ),
            ),
            Gaps.v24,
            GestureDetector(
              onTap: () => _onLoginSubmitted(),
              child: const FormButton(disabled: false, text: 'Log in'),
            ),
          ],
        ),
      ),
    );
  }
}
