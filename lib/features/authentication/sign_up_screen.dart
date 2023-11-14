import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/authentication/email_screen.dart';
import 'package:tiktokclone/features/authentication/login_screen.dart';
import 'package:tiktokclone/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _onEmailPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            children: [
              Gaps.v40,
              const Text(
                'Sign up for TikTok',
                style: TextStyle(
                  fontSize: Sizes.size36,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v20,
              const Text(
                'Create a profile, follow other accounts, make your own videos, and more.',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              GestureDetector(
                onTap: () => _onEmailPressed(context),
                child: const AuthButton(
                  text: 'Use email & password',
                  icon: FaIcon(FontAwesomeIcons.user),
                ),
              ),
              Gaps.v20,
              const AuthButton(
                text: 'Continue with Apple',
                icon: FaIcon(FontAwesomeIcons.apple),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade100,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onLoginPressed(context),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
