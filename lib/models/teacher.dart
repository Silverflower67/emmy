import 'package:emmy/utils/db.dart';
import 'package:sqflite/sqflite.dart';

enum Gender { male, female }

extension GenderMethods on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return "Masculino";
      case Gender.female:
        return "Femenino";
    }
  }
}

class Teacher {
  int id;
  String name;
  String lastName;
  String email;
  String? phone;
  Gender gender;
  int color;
  bool isReplacing;
  Teacher(
      this.id, this.name, this.lastName, this.email, this.color, this.gender,
      {this.phone, this.isReplacing = false});
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "lastName": lastName,
      "email": email,
      "phone": phone,
      "color": color.toRadixString(16),
      "isReplacing": isReplacing
    };
  }

  Teacher.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        lastName = map["lastName"],
        email = map["email"],
        gender = Gender.values[map["gender"]],
        color = int.parse(map["color"], radix: 16),
        isReplacing = map["isReplacing"];
  @override
  String toString() {
    final phoneStr = phone != null ? "phone:$phone" : "";
    return "Teacher{$name $lastName,email:$email${phoneStr.isNotEmpty ? ',$phoneStr' : ''}";
  }
}

Future<void> insertTeacher(Teacher teacher) async {
  final db = await getDb();
  await db.insert(
    'teachers',
    teacher.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Teacher>> getTeachers() async {
  final db = await getDb();
  final List<Map<String, dynamic>> maps = await db.query('teachers');
  return List.generate(maps.length, (i) {
    return Teacher.fromMap(maps[i]);
  });
}

Future<void> updateTeacher(Teacher teacher) async {
  final db = await getDb();
  await db.update('teachers', teacher.toMap(),
      where: "id = ?", whereArgs: [teacher.id]);
}

Future<void> deleteTeacher(int id) async {
  final db = await getDb();
  await db.delete('teachers', where: 'id = ?', whereArgs: [id]);
}
