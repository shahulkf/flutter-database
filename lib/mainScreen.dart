// import 'package:databasee/editScreen.dart';
// import 'package:databasee/model/data_model.dart';
// import 'package:flutter/material.dart';

// import 'Functions/db_functions.dart';
// import 'details.dart';

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student List'),
//       ),

//      body: Padding(
//        padding: const EdgeInsets.all(9),

//        child: Column(
//          children: [
//           SizedBox(
//             height:
//             50,
//             child: TextField(

//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search) ,

//               border: OutlineInputBorder(

//               ),

//                labelText: 'Search '
//             ),
//             ),
//           ),
//           SizedBox(height: 30,),
//            Expanded(
//              child: ValueListenableBuilder(
//               valueListenable: studentListNotifier,
//               builder:
//               (BuildContext ctx, List<StudentModel> studentList, Widget? child ) {
//                return ListView.separated(

//                 itemBuilder: (context , index){
//                   final data = studentList[index];
//                 return
//                 InkWell(
//                   onTap: (){
//                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> studentDetails(Details: data,)));
//                   },
//                   child: ListTile(
//                     title: Text(data.name  ),
//                     leading: CircleAvatar(
//                       backgroundImage: FileImage(data.image),
//                       radius: 30,
//                     ),

//                     // subtitle: Icon(Icons.edit),
//                     trailing:Wrap(
//                       children: [
//                         IconButton(
//                          color: Color.fromARGB(255, 206, 42, 42),
//                           onPressed: (){

//                       deleteStudent(data);
//                     },

//                     icon:Icon(Icons.delete,) ,

//                     ),
//                      IconButton(
//                       color: Color.fromARGB(255, 5, 141, 5),
//                       onPressed: (){
//                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditScreen(name: data.name,batch: data.batch,age: data.age,number: data.phoneNumber,id: index, image: data.image,)),);
//                      },
//                       icon: Icon(Icons.edit),),
//                       ]) ,

//                   )
//                 );

//                 },

//                 separatorBuilder: (context , index){
//                   return const Divider();

//                 },
//                  itemCount: studentList.length,
//                  );

//               } ,

//              ),
//            ),
//          ],
//        ),
//      ),
//     );
//   }
// }

import 'dart:developer';
import 'dart:io';

import 'package:databasee/editScreen.dart';
import 'package:databasee/model/data_model.dart';
import 'package:flutter/material.dart';

import 'Functions/db_functions.dart';
import 'details.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String search = '';
  refresh(String input) {
    setState(() {
      search = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ValueNotifier  <  List <StudentModel> >data=ValueNotifier([]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TextField(
                onChanged: (value) => refresh(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    labelText: 'Search '),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: studentListNotifier,
                builder: (BuildContext ctx, studentList, _) {
                  final filterlist = studentList
                      .where((student) => student.name
                          .toLowerCase()
                          .contains(search.toLowerCase()))
                      .toList();
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      // final data = studentList[index];
                      final dat = filterlist[index];
                      return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => studentDetails(
                                      Details: dat,
                                    )));
                          },
                          child: ListTile(
                            title: Text(dat.name),
                            leading: CircleAvatar(
                              backgroundImage: dat.image == ''
                                  ? const AssetImage('assets/dp1.png')
                                      as ImageProvider
                                  : FileImage(File(dat.image)),
                              radius: 30,
                            ),

                            // subtitle: Icon(Icons.edit),
                            trailing: Wrap(children: [
                              IconButton(
                                color: const Color.fromARGB(255, 206, 42, 42),
                                onPressed: () async {
                                  await deleteStudent(dat);
                                  studentListNotifier.notifyListeners();
                                  snackbar(context, 'Deleted Successfully');
                                },
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),
                              IconButton(
                                color: const Color.fromARGB(255, 5, 141, 5),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditScreen(
                                              name: dat.name,
                                              batch: dat.batch,
                                              age: dat.age,
                                              number: dat.phoneNumber,
                                              id: dat.id,
                                              image: dat.image,
                                            )),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                            ]),
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: filterlist.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

search(String querry) {
  List<StudentModel> data = studentListNotifier.value
      .where((element) =>
          element.name.toLowerCase().contains(querry.toLowerCase()))
      .toList();
  for (var element in data) {
    log(element.name);
  }
}

snackbar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    duration: const Duration(milliseconds: 800),
  ));
}
