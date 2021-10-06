import 'package:emmy/screens/tabs/teachers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  static final List<Widget> _pages = <Widget>[
    const Center(
      child: Text("¡Hola Mundo!"),
    ),
    const TeacherPage(),
    const Center(
      child: Text("Próximamente :)"),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Portada"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profesores"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Apuntes")
        ],
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}
