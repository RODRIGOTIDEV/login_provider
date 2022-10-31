import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_provider/app/core/models/user_model.dart';
import 'package:login_provider/app/features/auth/models/auth_request_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthState { idle, success, error, loading }

class AuthController extends ChangeNotifier {
  var authRequest = AuthRequestModel('', '');
  var state = AuthState.idle;

  Future<void> loginAction() async {
    state = AuthState.loading;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final response = await Dio()
          .post('http://localhost:8080/auth', data: authRequest.toMap());
      final shared = await SharedPreferences.getInstance();
      globaUserModel = UserModel.fromMap(jsonDecode(response.data));
      await shared.setString('UserModel', globaUserModel!.toJson());
      state = AuthState.success;
      notifyListeners();
      //Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      state = AuthState.error;
      notifyListeners();
      //  ScaffoldMessenger.of(context)
      //    .showSnackBar(const SnackBar(content: Text('Erro na autenticação')));
    }
  }
}
