import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/icons/USlotLogo.png'),
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Digite su correo electrónico",
                      helperText: "*Campo obligatorio",
                      prefixIcon: Icon(Icons.email)),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _password,
                  obscureText: _isPasswordVisible,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Digite su contraseña",
                      helperText: "*Campo obligatorio",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      )),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text("Iniciar Sesión"),
                ),
                const SizedBox(height: 8.0),
                TextButton(
                    onPressed: onPressed, child: child)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
