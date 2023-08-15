// import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/data_model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

late Database _db;

Future<void> initializeDataBase() async {
  _db = await openDatabase(
    'student.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE student(id INTEGER PRIMARY KEY , name TEXT , batch TEXT , age TEXT , phonenumber TEXT , image TEXT)');
    },
  );
  await getAllStudents();
}

Future<void> addStudent(StudentModel value) async {
  _db.rawInsert(
      'INSERT INTO student(name,batch,age,phonenumber,image) VALUES(?,?,?,?,?)',
      [value.name, value.batch, value.age, value.phoneNumber, value.image]);
  getAllStudents();

  // studentListNotifier.value.add(value);
  // studentListNotifier.notifyListeners;

  print(value.toString());
}

Future<void> deleteStudent(StudentModel value) async {
  await _db.rawDelete('DELETE FROM student WHERE id = ?', [value.id]);
  // studentListNotifier.value.removeWhere((element) => element==value,);
  await getAllStudents();
  // log('${value.id}') ;
  studentListNotifier.notifyListeners;
}

Future<void> getAllStudents() async {
  final _values = await _db.rawQuery('SELECT * FROM student');
  studentListNotifier.value.clear();
  for (var map in _values) {
    final student = StudentModel.fromMap(map);
    studentListNotifier.value.add(student);
  }
  studentListNotifier.notifyListeners;
}

Future<void> editDetails(StudentModel value) async {
  await _db.rawUpdate(
      'UPDATE student SET name = ? ,batch = ? ,age = ? , phonenumber = ? , image = ?  WHERE id = ?',
      [
        value.name,
        value.batch,
        value.age,
        value.phoneNumber,
        value.image,
        value.id
      ]);
  getAllStudents();
}
