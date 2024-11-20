import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_and_home_slotu/repository/firebase_api.dart';
import 'package:login_and_home_slotu/models/user.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final FirebaseApi _firebaseApi = FirebaseApi();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  bool _isPasswordObscure = true;
  bool _isrepPasswordObscure = true;

  void _showMessage(String msg) {
    SnackBar snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _saveUserToFirestore(User user, String uid, String role) async {
    try {
      await _firestore.collection('users').doc(uid).set(user.toJson(role));
    } catch (e) {
      _showMessage('Error al guardar datos en Firestore: $e');
    }
  }

  void _createUser(User user, String role) async {
    if (user.email.isNotEmpty && user.password.isNotEmpty) {
      try {
        String? result = await _firebaseApi.createUser(user.email, user.password);

        if (result == null) {
          _showMessage("Error desconocido al registrar el usuario");
          return;
        }

        switch (result) {
          case 'invalid-email':
            _showMessage('El correo electrónico está mal escrito');
            break;
          case 'email-already-in-use':
            _showMessage('Ya existe una cuenta con ese correo electrónico');
            break;
          case 'weak-password':
            _showMessage('La contraseña debe tener mínimo 6 dígitos');
            break;
          case 'network-request-failed':
            _showMessage('Revise su conexión a internet');
            break;
          default:
            _showMessage('Usuario registrado con éxito');
            await _saveUserToFirestore(user, result, role);
            Navigator.pop(context);
        }
      } catch (e) {
        _showMessage("Error inesperado: $e");
      }
    } else {
      _showMessage("ERROR: El correo electrónico o la contraseña no pueden ser nulos");
    }
  }

  void _onRegisterButtonClicked() {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      _showMessage("ERROR: Debe digitar correo electrónico y contraseña");
    } else if (_password.text != _repPassword.text) {
      _showMessage("ERROR: Las contraseñas deben de ser iguales");
    } else {
      var user = User.fromControllers(
        nameController: _name,
        emailController: _email,
        passwordController: _password,
      );
      _createUser(user, "laboratorista");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF004B28),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/usuario.png', width: 150, height: 150, fit: BoxFit.cover),
                const SizedBox(height: 24.0),
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    labelText: "Digite su nombre",
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
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Digite su correo",
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
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _password,
                  obscureText: _isPasswordObscure,
                  decoration: InputDecoration(
                    labelText: "Digite su contraseña",
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
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white70), // Cambia el color del icono
                      onPressed: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _repPassword,
                  obscureText: _isrepPasswordObscure,
                  style: TextStyle(
                    color: Colors.black, // Cambia el color a azul
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    labelText: "Repita la contraseña",
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
                    suffixIcon: IconButton(
                      icon: Icon(_isrepPasswordObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white70), // Cambia el color del icono
                      onPressed: () {
                        setState(() {
                          _isrepPasswordObscure = !_isrepPasswordObscure;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _onRegisterButtonClicked,
                  child: const Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
