import 'package:emmy/models/teacher.dart';
import 'package:emmy/screens/create/teacher.dart';
import 'package:flutter/material.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key}) : super(key: key);
  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  List<Teacher> teachers = [];
  @override
  initState() {
    teachers = [];
    super.initState();
    Future<List<Teacher>>.sync(getTeachers).then((value) {
      setState(() {
        teachers = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (teachers.isNotEmpty) {
      final fullNames = List.generate(teachers.length, (index) {
        return "${teachers[index].name} ${teachers[index].lastName}";
      });
      body = ListView.builder(
        itemCount: fullNames.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ], color: Color(teachers[index].color)),
            child: Text(fullNames[index]),
          );
        },
        physics: const BouncingScrollPhysics(),
      );
    } else {
      body = const Center(
        child: Text("No hay profesores"),
      );
    }
    return Scaffold(
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TeacherCreate()));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
