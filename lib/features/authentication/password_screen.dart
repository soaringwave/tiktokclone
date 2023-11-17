import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/authentication/birthday_screen.dart';
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
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _passwordControl.addListener(() {
      setState(() {
        _password = _passwordControl.text;
      });
    });
  }

  bool _isPasswordValid() {
    if (_password.isNotEmpty &&
        _password.length >= 8 &&
        _password.length <= 20) {
      return true;
    }
    return false;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _clearText() {
    _passwordControl.clear();
  }

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  void _onNextTap() {
    if (_isPasswordValid() == false) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
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
                'Create Password',
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v24,
              TextField(
                obscureText: _isObscure,
                onEditingComplete: _onNextTap,
                autocorrect: false,
                controller: _passwordControl,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: _clearText,
                        icon: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Theme.of(context).hintColor,
                          size: Sizes.size24,
                        ),
                      ),
                      IconButton(
                        onPressed: _toggleObscure,
                        icon: FaIcon(
                          _isObscure
                              ? FontAwesomeIcons.solidEye
                              : FontAwesomeIcons.solidEyeSlash,
                          color: Theme.of(context).hintColor,
                          size: Sizes.size24,
                        ),
                      ),
                    ],
                  ),
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
              Gaps.v12,
              const Text(
                'Your password must have:',
                style: TextStyle(
                  fontSize: Sizes.size14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v12,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: _isPasswordValid()
                        ? Colors.green
                        : Theme.of(context).hintColor,
                    size: Sizes.size24,
                  ),
                  Gaps.h10,
                  const Text(
                    '8 to 20 characters',
                    style: TextStyle(
                      fontSize: Sizes.size14,
                    ),
                  ),
                ],
              ),
              Gaps.v24,
              GestureDetector(
                onTap: _onNextTap,
                child: FormButton(
                  disabled: !_isPasswordValid(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
