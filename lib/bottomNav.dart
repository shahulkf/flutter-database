// import 'package:databasee/mainScreen.dart';
// import 'package:databasee/signup.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {

// int _currentSelectedIndex = 0;
// final _pages = [
//   MainScreen(),
//   SignUp(),
// ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentSelectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         iconSize: 38,
//         currentIndex: _currentSelectedIndex,
//         onTap: (newIndex){
//           setState(() {
//             _currentSelectedIndex = newIndex;
//           });
//         },
//         items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Details'),
//         BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),

//       ]),

//     );
//   }
// }

import 'package:databasee/mainScreen.dart';
import 'package:databasee/signup.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentSelectedIndex = 0;
  final _pages = [
    MainScreen(),
    const SignUp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 38,
          currentIndex: _currentSelectedIndex,
          onTap: (newIndex) {
            setState(() {
              _currentSelectedIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Details'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          ]),
    );
  }
}
