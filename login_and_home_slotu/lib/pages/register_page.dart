import 'package:flutter/material.dart';
import 'package:login_and_home_slotu/repository/firebase_api.dart';
import 'package:login_and_home_slotu/models/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final FirebaseApi _firebaseApi = FirebaseApi();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  bool _isPasswordObscure = true;
  bool _isRepPasswordObscure = true;

  void _showMessage(String msg) {
    setState(() {
      SnackBar snackBar = SnackBar(content: Text(msg));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void _createUser(User user) async {
    String msg = "";

    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));*/

    var result = await _firebaseApi.createUser(user.email, user.password);

    if (result == 'invalid-email'){
      _showMessage('El correo electrónico está mal escrito');
    }
    else if (result == 'email-already-in-use'){
      _showMessage('Ya existe una cuenta con ese corre electrónico');
    }
    else if (result == 'weak-password'){
      _showMessage('La contraseña debe tener mínimo 6 digitos');
    }
    else if (result == 'network-request-failed'){
      _showMessage('Revise su conexión a internet');
    }
    else {
      _showMessage('Usuario registrado con éxito');
      Navigator.pop(context);
    }
  }

  void _onRegisterButtonClicked() {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      _showMessage("ERROR: Debe digitar correo electrónico y contraseña");
    } else if (_password.text != _repPassword.text) {
      _showMessage("ERROR: Las contraseñas deben de ser iguales");
    }
      var user = User(
          _name.text,
          _email.text,
          _password.text
      );
      _createUser(user);

      /* code */
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
                Image(
                  image: AssetImage('assets/images/usuario.png'),
                  width: 150,  // Cambia el ancho según tus necesidades
                  height: 150, // Cambia la altura según tus necesidades
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    labelText: "Digite su nombre",
                    labelStyle: TextStyle(
                      color: Colors.white, // Cambia el color del texto del label
                      fontSize: 16, // Ajusta el tamaño de la fuente
                    ),// Fondo suave detrás del campo de texto
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16), // Bordes redondeados
                      borderSide: BorderSide(
                        color: Colors.white, // Color del borde
                        width: 2, // Grosor del borde
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Digite su correo",
                    labelStyle: TextStyle(
                      color: Colors.white, // Cambia el color del texto del label
                      fontSize: 16, // Ajusta el tamaño de la fuente
                    ),// Fondo suave detrás del campo de texto
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16), // Bordes redondeados
                      borderSide: BorderSide(
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
                    obscureText: _isPasswordObscure,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Digite su contraseña",
                      helperText: "*Campo obligatorio",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          icon: Icon(_isPasswordObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isPasswordObscure = !_isPasswordObscure;
                            });
                          }),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value!.isPasswordValid()
                        ? null
                        : "La contraseña debe tener mínimo 6 caracteres"),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _repPassword,
                  obscureText: _isRepPasswordObscure,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Repita la contraseña",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: Icon(_isRepPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isRepPasswordObscure = !_isRepPasswordObscure;
                          });
                        }),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 6.0,
                ),
                GestureDetector(
                  onTap: () {
                    _onRegisterButtonClicked();
                  },
                  child: const Image(
                    image: AssetImage('assets/images/registrarseblanco.png'),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
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

extension on String {
  bool isPasswordValid() {
    return this.length > 5;
  }
}