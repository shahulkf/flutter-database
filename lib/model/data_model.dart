import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StudentModel {
  int? id;
  final String name;
  final String batch;
  final String age;
  final String phoneNumber;
  final String image;

  StudentModel(
      {required this.name,
      required this.batch,
      required this.age,
      required this.phoneNumber,
      required this.image,
      this.id});

  static StudentModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final batch = map['batch'] as String;
    final age = map['age'] as String;
    final phonenumber = map['phonenumber'] as String;
    final image = map['image'] as String;

    return StudentModel(
        id: id,
        name: name,
        batch: batch,
        age: age,
        phoneNumber: phonenumber,
        image: image);
  }
}
