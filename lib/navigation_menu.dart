import 'package:flutter/material.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/features/auth/presentation/controller/signin_controller.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text("Navigation menu"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              SignInController.instance.signOut();
            },
            child: Text("Sign out")),
      ),
    );
  }
}
