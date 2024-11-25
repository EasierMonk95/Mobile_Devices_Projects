import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:login_and_home_slotu/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> _closesplah() async {
    await Future.delayed(const Duration(seconds: 3), () async {

      // Aquí forzamos un error intencional
      try {
        throw Exception("Error intencional desde SplashPage");
      } catch (e, stackTrace) {
        // Registra el error en Crashlytics
        FirebaseCrashlytics.instance.recordError(e, stackTrace);
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  void initState() {
    _closesplah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF004B28),
      body: Center(
        child: Image(
          image: AssetImage('assets/images/USlotLogo.png'),
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


