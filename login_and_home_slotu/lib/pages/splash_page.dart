import 'package:flutter/material.dart';
import 'package:login_and_home_slotu/pages/login_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> _closesplah() async{
    await Future.delayed(const Duration(seconds:3),() async{
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  void initState(){
    _closesplah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF004B28),
      body:Center(
        child:Image(
          image: AssetImage('assets/images/USlotLogo.png'),
          width: 150,  // Cambia el ancho según tus necesidades
          height: 150, // Cambia la altura según tus necesidades
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
