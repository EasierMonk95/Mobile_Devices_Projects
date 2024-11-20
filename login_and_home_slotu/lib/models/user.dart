import 'package:flutter/material.dart';
class User {
  var _name;
  var _email;
  var _password;

  User.Empty();

  Map<String, dynamic> toJson(String role) => {
    "name": _name,
    "email": _email,
    "password": _password,
    "role": role, // El rol se recibe externamente
  };

  User.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _email = json['email'],
        _password = json['password'];

  get name => _name;
  set name(value) => _name = value;

  get email => _email;
  set email(value) => _email = value;

  get password => _password;
  set password(value) => _password = value;

  User(this._name, this._email, this._password);

  // Método estático para simplificar la creación del usuario
  static User fromControllers({
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) {
    return User(
      nameController.text,
      emailController.text,
      passwordController.text,
    );
  }
}
