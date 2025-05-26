import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:modernloginpage/widgets/auth/custom_text_field.dart';
import 'package:modernloginpage/widgets/auth/social_login_button.dart';
import 'package:modernloginpage/widgets/common/animated_background.dart';
import 'package:modernloginpage/utils/constants.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        imagePath: AppConstants.carBackground2,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInDown(
                    child: Text(
                      'Create Account',
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    hintText: 'Full Name',
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Email',
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Password',
                    icon: Icons.lock,
                    isPassword: true,
                  ),
                  const SizedBox(height: 24),
                  FadeInUp(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Sign Up'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FadeInUp(
                    delay: const Duration(milliseconds: 200),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Already have an account? Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialLoginButton(
                          iconPath: AppConstants.googleIcon,
                          onPressed: () {},
                        ),
                        SocialLoginButton(
                          iconPath: AppConstants.facebookIcon,
                          onPressed: () {},
                        ),
                        SocialLoginButton(
                          iconPath: AppConstants.instagramIcon,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}