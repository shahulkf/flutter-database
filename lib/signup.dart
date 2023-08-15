import 'dart:io';
import 'package:databasee/Functions/db_functions.dart';
import 'package:databasee/mainScreen.dart';
import 'package:databasee/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();

  final batchController = TextEditingController();

  final ageController = TextEditingController();

  final phonenumberController = TextEditingController();
  final locationController = TextEditingController();
  // final circleAvatarController = TextEditingController();
  // XFile? img;
  String? imagePath;

  final _formKey = GlobalKey<FormState>();

  get id => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),

                InkWell(
                  onTap: () async {
                    XFile? img = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (img != null) {
                      imagePath = img.path;
                    }
                    setState(() {});
                  },
                  child: CircleAvatar(
                    backgroundImage: imagePath != null
                        ? FileImage(File(imagePath!))
                        : AssetImage(
                            'assets/dp1.png',
                          ) as ImageProvider,
                    radius: 45,
                    // child: Icon(
                    //   Icons.person,
                    //   size: 40,

                    //   ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'name',
                    prefixIcon: Icon(Icons.person_4),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your Name';
                    } else if (!isAlphabet(value)) {
                      return 'Enter A Valid Name';
                    } else {
                      return null;
                    }
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: batchController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Batch',
                    prefixIcon: Icon(Icons.calendar_month),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your Batch';
                    } else if (!isBatch(value)) {
                      return 'Enter a Valid Batch';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Age',
                      prefixIcon: Icon(Icons.cake)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your Age';
                    } else if (!isValidAge(value)) {
                      return 'Enter A Valid Age';
                    } else {
                      return null;
                    }
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phonenumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone_android_rounded),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your Phone Number ';
                    } else if (!isValidPhoneNumber(value)) {
                      return 'Enter 10 Digit Phone Number';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 15,),

                TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Location',
                    prefixIcon: Icon(Icons.map_sharp),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Enter A Valid Location';
                    }else{
                      return null;
                    }
                  },
                ),

                const SizedBox(
                  height: 10,
                ), 
                ElevatedButton(
                  onPressed: () {
                    setState(() async {
                      bool isAdded = await onAddSaveButtonClicked();
                      if (isAdded) {
                        getclearStudents();
                        snackbar(context, 'Added SuccessFully');
                      }
                    });

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),));
                  },
                  child: const Text('Save'),
                ),
                // TextButton(onPressed: (){}, child: const Text('Save'),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onAddSaveButtonClicked() async {
    final name = nameController.text.trim();
    final batch = batchController.text.trim();
    final age = ageController.text.trim();
    final phone = phonenumberController.text.trim();
    if (!_formKey.currentState!.validate()) {
      return false;
    }

    final student = StudentModel(
      name: name,
      batch: batch,
      age: age,
      phoneNumber: phone,
      image: imagePath ?? '',
    );
    addStudent(student);
    return true;
  }

  void getclearStudents()  {
    nameController.clear();
    batchController.clear();
    ageController.clear();
    phonenumberController.clear();
    imagePath = null;
  }

  bool isAlphabet(String input) {
    final alphabetsRegex = RegExp(r'^[a-zA-Z]+$');
    return alphabetsRegex.hasMatch(input);
  }

  bool isValidAge(String input) {
    final ageRegex = RegExp(r'^[1-9][0-9]{0,2}$');
    return ageRegex.hasMatch(input);
  }

  bool isValidPhoneNumber(String input) {
    final phoneNumberRegex = RegExp(r'^[0-9]{10}$');
    return phoneNumberRegex.hasMatch(input);
  }

  bool isBatch(String input) {
    final batchRegex = RegExp(r'^[1-9][0-9]{0,2}$');
    return batchRegex.hasMatch(input);
  }
}
