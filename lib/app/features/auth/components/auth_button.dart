import 'package:flutter/material.dart';
import 'package:login_provider/app/features/auth/auth_controller.dart';
import 'package:provider/provider.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();
    return ElevatedButton(
      onPressed: controller.state == AuthState.loading
          ? null
          : () {
              controller.loginAction();
            },
      child: const Text('Login'),
    );
  }
}
