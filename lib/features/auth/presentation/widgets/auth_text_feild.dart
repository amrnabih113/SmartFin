import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/colors.dart';

class AuthTextFeild extends StatelessWidget {
  final String title;
  final IconData icon;
  final TextEditingController? controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  const AuthTextFeild(
      {super.key,
      required this.title,
      required this.icon,
      this.controller,
      this.validator,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: MyColors.primaryColor,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
          labelText: title,
          hintText: title,
          prefixIcon: Icon(
            icon,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: const Icon(
                    Icons.visibility_off_outlined,
                  ),
                  onPressed: () {},
                )
              : null),
    );
  }
}
