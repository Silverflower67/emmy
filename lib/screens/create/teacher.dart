import 'package:flutter/material.dart';

class TeacherCreate extends StatefulWidget {
  const TeacherCreate({Key? key}) : super(key: key);
  @override
  _TeacherCreateState createState() => _TeacherCreateState();
}

class _TeacherCreateState extends State<TeacherCreate> {
  final _formKey = GlobalKey<_TeacherCreateState>();
  @override
  Widget build(BuildContext context) {
    var genders = const <Icon>[
      Icon(
        Icons.male,
        color: Colors.blue,
      ),
      Icon(
        Icons.female,
        color: Colors.pink,
      ),
    ];
    var gender = genders[0];
    bool isReplacing = false;
    Map<String, TextEditingController> textControllers = Map.fromEntries([
      "name",
      "lastName",
      "phone",
      "email",
    ].map((k) {
      return MapEntry(k, TextEditingController());
    }));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Añadir profesor"),
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Nombre
              const Text("Nombre"),
              TextFormField(
                controller: textControllers["name"],
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Introduce un nombre, ¿o tu profesor(a) es el/la innombrable";
                  }
                },
              ),
              // Apellido
              const Text("Apellido"),
              TextFormField(
                controller: textControllers["lastName"],
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Introduce un apellido, ¿o tu profesor(a) no tiene?";
                  }
                },
              ),
              // Género
              const Text("Género"),
              DropdownButtonFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100),
                value: gender,
                items: genders.map((i) {
                  return DropdownMenuItem(
                    value: i,
                    child: i,
                  );
                }).toList(),
                onChanged: (Icon? val) {
                  setState(() {
                    gender = val!;
                  });
                },
              ),
              const Text("Teléfono"),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100),
              ),
              const Text("E-mail"),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Introduce un e-mail, ¿o tu profesor/a vive en la Edad de Piedra";
                  }
                },
              ),
              Row(
                children: [
                  const Text("¿Es reemplazante?"),
                  Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.all(Colors.teal),
                      value: isReplacing,
                      onChanged: (bool? val) {
                        setState(() {
                          isReplacing = val!;
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
