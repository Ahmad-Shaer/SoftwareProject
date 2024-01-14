import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final String label;
  final IconData icon;
  final TextEditingController controller;
  const CustomTextField(
  {super.key, required this.label, required this.placeholder, required this.icon, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      ),

      style: TextStyle(),

    );
  }

}