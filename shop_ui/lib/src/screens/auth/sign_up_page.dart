import 'package:flutter/material.dart';

import '../../components/horizontal_line.dart';
import '../../constants/constants.dart';
import 'components/signup_form.dart';
import 'login_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                AppImages.logo,
                height: 100,
              ),
              const SizedBox(height: AppDefaults.margin * 2),
              // Header
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppDefaults.margin * 2),
          
              /// Sign up forms
              const SignUpForm(),
              const Spacer(),
          
              /// OR
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HorizontalLine(width: 100),
                  Text('Or'),
                  HorizontalLine(width: 100),
                ],
              ),
              const Spacer(),
          
              /// Social Logins
              const SocialLogins(),
              const Spacer(),
          
              /// Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                      },
                      child: const Text('Login'))
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
