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
      _createUser(user, "normal");
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
                  decoration: const InputDecoration(labelText: "Digite su nombre"),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: "Digite su correo"),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _password,
                  obscureText: _isPasswordObscure,
                  decoration: InputDecoration(
                    labelText: "Digite su contraseña",
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordObscure ? Icons.visibility : Icons.visibility_off),
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
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Repita la contraseña"),
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
