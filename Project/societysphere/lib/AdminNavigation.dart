// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:societysphere/adminProfilePage.dart';
// import 'package:societysphere/admindashboard.dart';
// import 'package:societysphere/complaint.dart';

// class Adminbottomnavigation extends StatefulWidget {
//   Adminbottomnavigation({super.key, required String adminName, required String userId, required String adminFlatNo, required String societyName, required String role});

//   @override
//   State<Adminbottomnavigation> createState() => _AdminbottomnavigationState();
// }

// class _AdminbottomnavigationState extends State<Adminbottomnavigation> {
//   int currentIndex = 0;
//   int unreadNotificationCount =
//       5; // Initial unread notifications (replace with dynamic data)

//   // final List<String> title = [
//   //   'Overview',
//   //   'Dashboard',
//   //   'Notifications',
//   //   'Profile',
//   // ];

//   final List<Color> containerColors = [
//     Colors.blue.shade100,
//     Colors.white,
//     Colors.red.shade100,
//     Colors.purple.shade100,
//   ];

//   final List<Widget> screens = [
//     AdminDashBoard(
//       adminName: '',
//     ),
//     Center(child: Text('Dashboard Screen', style: TextStyle(fontSize: 20))),
//     ComplaintScreenApp(),
//     AdminProfilePage(userId: widget.userId),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             color: containerColors[currentIndex],
//             child: screens[currentIndex],
//           ),
//           Positioned(
//             bottom: 1,
//             left: 0,
//             right: 0,
//             child: CurvedNavigationBar(
//               items: <Widget>[
//                 const Icon(Icons.dashboard, size: 30, color: Colors.white),
//                 const Icon(Icons.search, size: 30, color: Colors.white),
//                 Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     const Icon(Icons.notifications,
//                         size: 30, color: Colors.white),
//                     if (unreadNotificationCount > 0)
//                       Positioned(
//                         top: -5,
//                         right: -5,
//                         child: Container(
//                           padding: const EdgeInsets.all(5),
//                           decoration: const BoxDecoration(
//                             color: Colors.red,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Text(
//                             '$unreadNotificationCount',
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 10,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//                 const Icon(Icons.person, size: 30, color: Colors.white),
//               ],
//               color: Colors.blue,
//               buttonBackgroundColor: Colors.blueGrey,
//               backgroundColor: Colors.transparent,
//               height: 50, // Adjust height here
//               animationCurve: Curves.easeInOut,
//               animationDuration: const Duration(milliseconds: 500),
//               onTap: (index) {
//                 setState(() {
//                   currentIndex = index;
//                   if (index == 2) {
//                     // Reset unread notifications if user views the notifications
//                     unreadNotificationCount = 0;
//                   }
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
