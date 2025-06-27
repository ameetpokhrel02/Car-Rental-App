import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 800),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.15),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: TextField(
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 15,
          ),
          obscureText: isPassword,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              color: Colors.white.withOpacity(0.5),
              fontSize: 15,
            ),
            icon: Icon(icon, color: Colors.white.withOpacity(0.7)),
          ),
        ),
      ),
    );
  }
}