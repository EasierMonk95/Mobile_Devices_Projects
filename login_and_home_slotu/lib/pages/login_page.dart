import 'package:flutter/material.dart';
import 'package:login_and_home_slotu/pages/home_page.dart';
import 'package:login_and_home_slotu/pages/register_page.dart';
import 'package:google_fonts/google_fonts.dart';
import '../repository/firebase_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  final FirebaseApi _firebaseApi = FirebaseApi();

  bool _isPasswordObscure = true;

  void _showMessage(String msg) {
    SnackBar snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _onLoginButtonClicked() async {
    final result = await _firebaseApi.signInUser(_email.text, _password.text);

    if (result == 'invalid-email') {
      _showMessage('El correo electrónico está mal escrito');
    } else if (result == 'network-request-failed') {
      _showMessage('Revise su conexión a internet');
    } else if (result == 'invalid-credential') {
      _showMessage('Correo electrónico o contraseña incorrecta');
    } else {
      _showMessage('Bienvenido');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF004B28), // Fondo verde oscuro
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/USlotLogo.png'),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Slot U',
                    style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.white),
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Correo electrónico",
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    filled: true,
                    fillColor: const Color(0x4DFFFFFF), // Fondo del campo
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white70),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white), // Texto del input
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isPasswordObscure,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    prefixIcon: const Icon(Icons.lock, color: Colors.white70),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: const Color(0x4DFFFFFF), // Fondo del campo
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white70),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: _onLoginButtonClicked,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Botón blanco
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 32.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Iniciar sesión",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF004B28), // Texto verde oscuro
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "¿No tienes cuenta? Registrarse",
                    style: TextStyle(
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
