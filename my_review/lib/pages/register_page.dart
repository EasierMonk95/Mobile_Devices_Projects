import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre { male, female }

class _RegisterPageState extends State<RegisterPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  bool _isPasswordVisible = true;
  bool _isrepPasswordVisible = true;

  Genre? _genre = Genre.male;

  bool _isActionFavorite = false;
  bool _isAdventureFavorite = false;
  bool _isComedyFavorite = false;
  bool _isHorrorFavorite = false;
  bool _isRomanceFavorite = false;
  bool _isFantasyFavorite = false;

  String buttonMsg = "Fecha de Nacimiento";

  DateTime _data = DateTime.now();

  String _dateConverter(DateTime newDate){
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateFormatted = formatter.format(newDate);
    return dateFormatted;
  }

  void _showSelectedDate() async {
    final DateTime ? newDate = await showDatePicker(
      context: context,
      locale: const Locale("es", "CO"),
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    helpText: "Fecha de Nacimiento",
    );
    if (newDate != null){
      setState(() {
        _data = newDate;
        buttonMsg = "Fecha de Nacimiento ${_dateConverter(_data)}";
      });
    }
  }


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
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Digite su nombre",
                      prefixIcon: Icon(Icons.person)),
                  keyboardType: TextInputType.name,
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
                TextFormField(
                  controller: _repPassword,
                  obscureText: _isrepPasswordVisible,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Digite su contraseña nuevamente",
                      helperText: "*Campo obligatorio",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_isrepPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isrepPasswordVisible = !_isrepPasswordVisible;
                          });
                        },
                      )),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 8.0),
                const Text("Seleccione su género"),
                Row(
                  children: [
                    Expanded(
                        child: ListTile(
                      title: const Text("Masculino"),
                      leading: Radio<Genre>(
                        value: Genre.male,
                        groupValue: _genre,
                        onChanged: (Genre? value) {
                          setState(() {
                            _genre = value;
                          });
                        },
                      ),
                    )),
                    Expanded(
                      child: ListTile(
                        title: const Text("Femenino"),
                        leading: Radio<Genre>(
                          value: Genre.female,
                          groupValue: _genre,
                          onChanged: (Genre? value) {
                            setState(() {
                              _genre = value;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const Text("Género de película"),
                CheckboxListTile(
                    title: const Text("Acción"),
                    value: _isActionFavorite,
                    selected: _isActionFavorite,
                    onChanged: (bool? value) {
                      setState(() {
                        _isActionFavorite = value!;
                      });
                    }),
                CheckboxListTile(
                    title: const Text("Aventura"),
                    value: _isAdventureFavorite,
                    selected: _isAdventureFavorite,
                    onChanged: (bool? value) {
                      setState(() {
                        _isAdventureFavorite = value!;
                      });
                    }),
                CheckboxListTile(
                    title: const Text("Comedia"),
                    value: _isComedyFavorite,
                    selected: _isComedyFavorite,
                    onChanged: (bool? value) {
                      setState(() {
                        _isComedyFavorite = value!;
                      });
                    }),
                CheckboxListTile(
                    title: const Text("Fantasía"),
                    value: _isFantasyFavorite,
                    selected: _isFantasyFavorite,
                    onChanged: (bool? value) {
                      setState(() {
                        _isFantasyFavorite = value!;
                      });
                    }),
                CheckboxListTile(
                    title: const Text("Terror"),
                    value: _isHorrorFavorite,
                    selected: _isHorrorFavorite,
                    onChanged: (bool? value) {
                      setState(() {
                        _isHorrorFavorite = value!;
                      });
                    }),
                CheckboxListTile(
                    title: const Text("Romance"),
                    value: _isRomanceFavorite,
                    selected: _isRomanceFavorite,
                    onChanged: (bool? value) {
                      setState(() {
                        _isRomanceFavorite = value!;
                      });
                    }),
                ElevatedButton(
                    child: Text(buttonMsg),
                    onPressed: (){
                      _showSelectedDate();
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
