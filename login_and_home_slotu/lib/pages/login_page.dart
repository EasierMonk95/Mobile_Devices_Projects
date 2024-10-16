import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _correo = TextEditingController();
  final _contrasena = TextEditingController();


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
                  controller: _correo,
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
                  controller: _contrasena,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Digite su contraseña",
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
                  height: 6.0,
                ),
                const Image(
                  image: AssetImage('assets/images/iniciar-sesion.png'),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
