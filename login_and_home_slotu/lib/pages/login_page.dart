import 'package:flutter/material.dart';
import 'package:login_and_home_slotu/pages/home_page.dart';
import 'package:login_and_home_slotu/pages/register_page.dart';

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

  //User user = User.Empty();

  bool _isPasswordObscure = true;

  void _showMessage(String msg) {
    setState(() {
      SnackBar snackBar = SnackBar(content: Text(msg));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  Future<void> _onLoginButtonClicked() async{
    final result = await _firebaseApi.signInUser(_email.text, _password.text);

    if (result == 'invalid-email') {
      _showMessage('El correo electrónico está mal escrito');
    }  else if (result == 'network-request-failed') {
      _showMessage('Revise su conexión a internet');
    } else if (result == 'invalid-credential') {
      _showMessage('Correo electronico o contrasena incorrecta');
    } else {
      _showMessage('Bienvenido');
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage()));
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
                const Image(
                  image: AssetImage('assets/images/USlotLogo.png'),
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Digite su correo",
                    labelStyle: const TextStyle(
                      color: Colors.white, // Cambia el color del texto del label
                      fontSize: 16, // Ajusta el tamaño de la fuente
                    ),// Fondo suave detrás del campo de texto
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16), // Bordes redondeados
                      borderSide: const BorderSide(
                        color: Colors.blueAccent, // Color del borde
                        width: 2, // Grosor del borde
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isPasswordObscure, // Añade esta línea
                  decoration: InputDecoration(
                    labelText: "Digite su contraseña",
                    labelStyle: const TextStyle(
                      color: Colors.white, // Cambia el color del texto del label
                      fontSize: 16, // Ajusta el tamaño de la fuente
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16), // Bordes redondeados
                      borderSide: const BorderSide(
                        color: Colors.blueAccent, // Color del borde
                        width: 2, // Grosor del borde
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                GestureDetector(
                  onTap: () {
                    _onLoginButtonClicked();
                  },
                  child: const Image(
                    image: AssetImage('assets/images/iniciar-sesion.png'),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=> const RegisterPage()));
                    },
                    child: const Text("Registrarse")
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
