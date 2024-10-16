import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nombre = TextEditingController();
  final _correo = TextEditingController();
  final _contrasena = TextEditingController();
  final _repcontrasena = TextEditingController();

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
                  controller: _nombre,
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
                  controller: _correo,
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
                  controller: _contrasena,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Digite su contraseña",
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
                  controller: _repcontrasena,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Repita su contraseña",
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
                  height: 6.0,
                ),
                Image(
                  image: AssetImage('assets/images/registrarseblanco.png'),
                  width: 100,  // Cambia el ancho según tus necesidades
                  height: 100, // Cambia la altura según tus necesidades
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
