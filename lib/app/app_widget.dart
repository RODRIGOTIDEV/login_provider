import 'package:flutter/material.dart';
import 'package:login_provider/app/features/auth/auth_controller.dart';
import 'package:login_provider/app/features/auth/auth_page.dart';
import 'package:login_provider/app/features/home/home_page.dart';
import 'package:login_provider/app/core/models/user_model.dart';
import 'package:login_provider/app/features/sphash/splash_page.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthController())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashPage(),
          '/auth': (_) => const AuthPage(),
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
