import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_provider/app/features/auth/auth_controller.dart';
import 'package:login_provider/app/features/auth/models/auth_request_model.dart';
import 'package:login_provider/app/core/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/auth_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final AuthController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<AuthController>();
    controller.addListener(() {
      if (controller.state == AuthState.error) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Erro na autenticação')));
      } else if (controller.state == AuthState.success) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              onChanged: (value) {
                controller.authRequest =
                    controller.authRequest.copyWith(email: value);
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              onChanged: (value) {
                controller.authRequest =
                    controller.authRequest.copyWith(password: value);
              },
            ),
            const SizedBox(height: 13),
            const AuthButton(),
          ],
        ),
      ),
    );
  }
}
