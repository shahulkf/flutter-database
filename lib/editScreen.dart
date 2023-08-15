//     import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class EditScreen extends StatelessWidget {
//    EditScreen({super.key, required this.name,required this.batch,required this.age,required this.number ,required this.id , required this.image});
//   final name;
//   final batch;
//   final age;
//   final number;
// final id ;
// final image;
//  final nameEditController = TextEditingController();

//   final batchEditController = TextEditingController();

//   final ageEditController = TextEditingController();

//   final phonenumbeEditrController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     nameEditController.text=name;
// batchEditController.text = batch;
// ageEditController.text = age;
// phonenumbeEditrController.text = number;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Details'),
//         ),
//         body:Center(
//          child: Padding(padding: EdgeInsets.all(9),

//       child: Form(child:ListView(
//         children: [
//           SizedBox(height: 30,),
//           CircleAvatar(
//             backgroundImage: FileImage(image),
//             radius: 60,),

//           SizedBox(height: 30,),

//         TextFormField(
//           controller: nameEditController,
//           decoration: InputDecoration(

//           border: OutlineInputBorder(

//           )
//         ),
//         ),
//         SizedBox(height: 15,),

//         TextFormField(
//           controller: batchEditController,
//           decoration: InputDecoration(
//           border: OutlineInputBorder(

//           )
//         ),
//         ),

//         SizedBox(height: 15,),

//           TextFormField(
//             controller: ageEditController,
//             decoration: InputDecoration(
//           border: OutlineInputBorder(

//           )
//         ),
//         ),

//         SizedBox(height: 15,),
//           TextFormField(
//             controller: phonenumbeEditrController,
//             decoration: InputDecoration(
//           border: OutlineInputBorder(

//           )
//         ),
//         ),

//         SizedBox(height: 15,),
//          ElevatedButton(onPressed: (){

//          }, child: Text('update'))
//       ],)
//       ),  ) ,

//         )
//     );
//   }
// }

import 'dart:io';

import 'package:databasee/Functions/db_functions.dart';
import 'package:databasee/mainScreen.dart';
import 'package:databasee/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EditScreen extends StatefulWidget {
  const EditScreen(
      {super.key,
      required this.name,
      required this.batch,
      required this.age,
      required this.number,
      this.id,
      required this.image});
  final String name;
  final String batch;
  final String age;
  final String number;
  final int? id;
  final String image;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final nameEditController = TextEditingController();

  final batchEditController = TextEditingController();

  final ageEditController = TextEditingController();

  final phonenumbeEditrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameEditController.text = widget.name;
    batchEditController.text = widget.batch;
    ageEditController.text = widget.age;
    phonenumbeEditrController.text = widget.number;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Details'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Form(
                child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  backgroundImage: widget.image != ''
                      ? FileImage(File(widget.image))
                      : const AssetImage(
                          'assets/dp1.png',
                        ) as ImageProvider,
                  radius: 60,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: nameEditController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: batchEditController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: ageEditController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: phonenumbeEditrController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () async {
                      // editStudent();

                      StudentModel student = StudentModel(
                          name: nameEditController.text,
                          batch: batchEditController.text,
                          age: ageEditController.text,
                          phoneNumber: phonenumbeEditrController.text,
                          image: widget.image,
                          id: widget.id);
                      await editDetails(student);
                      await getAllStudents();
                      studentListNotifier.notifyListeners();
                      snackbar(context, 'Updated Successfully');
                      Navigator.pop(context);
                    },
                    child: const Text('update'))
              ],
            )),
          ),
        ));
  }
}
