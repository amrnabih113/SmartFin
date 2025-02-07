import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/features/auth/presentation/controller/signin_controller.dart';

class AuthTextFeild extends StatelessWidget {
  final String title;
  final IconData icon;
  final TextEditingController? controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  const AuthTextFeild({
    super.key,
    required this.title,
    required this.icon,
    this.controller,
    this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final signInController = SignInController.instance;
    return Obx(() {
      final hidePassword = signInController.hidePassword.value;
      return TextFormField(
        controller: controller,
        cursorColor: MyColors.primaryColor,
        validator: validator,
        obscureText: isPassword && signInController.hidePassword.value,
        decoration: InputDecoration(
          labelText: title,
          hintText: title,
          prefixIcon: Icon(icon),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    hidePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: signInController.togglePassword,
                )
              : null,
        ),
      );
    });
  }
}
