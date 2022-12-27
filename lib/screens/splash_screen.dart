import 'package:flutter/material.dart';
import 'package:mobile_task/screens/home_screen.dart';
import 'package:mobile_task/screens/login_screen.dart';

import '../utils/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const LoginScreen()));
        },
        child: const Icon(Icons.forward),
      ),
      body: const SafeArea(
          child: Center(
        child: Image(
          image: AssetImage(Config.app_icon),
          height: 80,
          width: 80,
        ),
      )),
    );
  }
}
