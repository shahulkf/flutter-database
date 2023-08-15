//   import 'package:databasee/model/data_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class studentDetails extends StatelessWidget {
//    studentDetails({super.key , required this.Details});

//   StudentModel Details;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Details'),
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 80,),

//           Center(
//             child: CircleAvatar(
//               backgroundImage:FileImage(Details.image) ,
//               radius: 50,
//               ),

//           ),

//        SizedBox(height: 30,),

//        Text('Name : ${Details.name}' ,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.5)),
//        SizedBox(height: 20,),
//        Text("Batch : ${Details.batch}" , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 20.5),),
//        SizedBox(height: 20,),
//        Text('Age :${Details.age}', style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 20.5),),
//        SizedBox(height: 20,),
//        Text('Phone : ${Details.phoneNumber}' , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 20.5 ,),),
//        SizedBox(height: 20,),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:databasee/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class studentDetails extends StatelessWidget {
  studentDetails({super.key, required this.Details});

  StudentModel Details;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Center(
            child: CircleAvatar(
              backgroundImage: Details.image == ''
                  ? const AssetImage('assets/dp1.png') as ImageProvider
                  : FileImage(File(Details.image)),
              radius: 50,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text('Name : ${Details.name}',
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 20.5)),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Batch : ${Details.batch}",
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20.5),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Age :${Details.age}',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20.5),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Phone : ${Details.phoneNumber}',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
