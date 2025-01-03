// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:societysphere/MembersPage.dart';
// import 'package:societysphere/adminProfilePage.dart';
// import 'package:societysphere/admindashboard.dart';
// import 'package:societysphere/complaint.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Adminbottomnavigation extends StatefulWidget {
//   final String adminId;

//   const Adminbottomnavigation({required this.adminId, required String adminName, required String adminFlatNo, required String societyName, required String role,});

//   @override
//   State<Adminbottomnavigation> createState() => _AdminbottomnavigationState();
// }

// class _AdminbottomnavigationState extends State<Adminbottomnavigation> {
//   int currentIndex = 0;
//   int unreadNotificationCount = 5;
//   late String adminName;
//   late String adminFlatNo;
//   late String societyName;
//   late String role;

//   @override
//   void initState() {
//     super.initState();
//     _getAdminDetails();
//   }

//   // Fetch admin details from Firestore
//   Future<void> _getAdminDetails() async {
//     DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('Users').doc(widget.adminId).get();

//     setState(() {
//       adminName = userSnapshot['name'];
//       adminFlatNo = userSnapshot['flatNo'];
//       societyName = userSnapshot['societyName'];
//       role = userSnapshot['role'];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Initialize the screens list here
//     final List<Widget> screens = [
//       AdminDashBoard(adminName: adminName, userName: '',),
//       MembersPage(),
//       ComplaintScreenApp(),
//       AdminProfilePage(
//         adminId: widget.adminId,
//         adminName: adminName,
//         adminFlatNo: adminFlatNo,
//         societyName: societyName,
//         role: role,
//       ),
//     ];

//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
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
//                     const Icon(Icons.notifications, size: 30, color: Colors.white),
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

// class Adminbottomnavigation extends StatefulWidget {
//   final String adminId;
//   final String adminName;
//   final String adminFlatNo;
//   final String societyName;
//   final String role;

//   const Adminbottomnavigation({
//     required this.adminId,
//     required this.adminName,
//     required this.adminFlatNo,
//     required this.societyName,
//     required this.role,
//   });

//   @override
//   State<Adminbottomnavigation> createState() => _AdminbottomnavigationState();
// }

// class _AdminbottomnavigationState extends State<Adminbottomnavigation> {
//   int currentIndex = 0;
//   int unreadNotificationCount = 5;
//   late String adminName;
//   late String adminFlatNo;
//   late String societyName;
//   late String role;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize with data passed from the constructor
//     adminName = widget.adminName;
//     adminFlatNo = widget.adminFlatNo;
//     societyName = widget.societyName;
//     role = widget.role;

//     _fetchLatestAdminDetails();
//   }

//   // Fetch the latest admin details from Firestore
//   Future<void> _fetchLatestAdminDetails() async {
//     try {
//       DocumentSnapshot userSnapshot =
//           await FirebaseFirestore.instance.collection('Users').doc(widget.adminId).get();

//       if (userSnapshot.exists) {
//         setState(() {
//           adminName = userSnapshot['name'];
//           adminFlatNo = userSnapshot['flatNo'];
//           societyName = userSnapshot['societyName'];
//           role = userSnapshot['role'];
//         });
//       }
//     } catch (e) {
//       // Handle Firestore error if needed
//       debugPrint("Error fetching admin details: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> screens = [
//       AdminDashBoard(adminName: adminName, userName: ''),
//       MembersPage(),
//       ComplaintScreenApp(),
//       AdminProfilePage(
//         adminId: widget.adminId,
//         adminName: adminName,
//         adminFlatNo: adminFlatNo,
//         societyName: societyName,
//         role: role, userId: '',
//       ),
//     ];

//     return Scaffold(
//       body: Stack(
//         children: [
//           screens[currentIndex],
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
//                     const Icon(Icons.notifications, size: 30, color: Colors.white),
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
//               height: 50,
//               animationCurve: Curves.easeInOut,
//               animationDuration: const Duration(milliseconds: 500),
//               onTap: (index) {
//                 setState(() {
//                   currentIndex = index;
//                   if (index == 2) {
//                     // Reset unread notifications when the notifications tab is viewed
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

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:societysphere/adminProfileEdit.dart';

import 'MembersPage.dart';
import 'adminProfilePage.dart';
import 'admindashboard.dart';
import 'complaint.dart';

class Adminbottomnavigation extends StatefulWidget {
  final String adminId;
  final String adminName;
  final String adminFlatNo;
  final String societyName;
  final String role;

  const Adminbottomnavigation({
    required this.adminId,
    required this.adminName,
    required this.adminFlatNo,
    required this.societyName,
    required this.role,
  });

  @override
  State<Adminbottomnavigation> createState() => _AdminbottomnavigationState();
}

class _AdminbottomnavigationState extends State<Adminbottomnavigation> {
  int currentIndex = 0;
  int unreadNotificationCount = 5;
  late String adminName;
  late String adminFlatNo;
  late String societyName;
  late String role;

  @override
  void initState() {
    super.initState();
    adminName = widget.adminName;
    adminFlatNo = widget.adminFlatNo;
    societyName = widget.societyName;
    role = widget.role;

    _fetchLatestAdminDetails();
  }

  Future<void> _fetchLatestAdminDetails() async {
    try {
      DocumentSnapshot adminSnapshot = await FirebaseFirestore.instance
          .collection('Admin')
          .doc(widget.adminId)
          .get();

      if (adminSnapshot.exists) {
        setState(() {
          adminName = adminSnapshot['name'];
          adminFlatNo = adminSnapshot['flatNo'];
          societyName = adminSnapshot['societyName'];
          role = adminSnapshot['role'];
        });
      }
    } catch (e) {
      debugPrint("Error fetching admin details: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      AdminDashBoard(
        adminName: adminName,
      ),
      MembersPage(),
      ComplaintScreenApp(),
      AdminProfilePage(
        adminId: widget.adminId,
        adminName: adminName,
        adminFlatNo: adminFlatNo,
        societyName: societyName,
        role: role,
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          screens[currentIndex],
          Positioned(
            bottom: 1,
            left: 0,
            right: 0,
            child: CurvedNavigationBar(
              items: <Widget>[
                const Icon(Icons.dashboard, size: 30, color: Colors.white),
                const Icon(Icons.people, size: 30, color: Colors.white),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.notifications,
                        size: 30, color: Colors.white),
                    if (unreadNotificationCount > 0)
                      Positioned(
                        top: -5,
                        right: -5,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '$unreadNotificationCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const Icon(Icons.person, size: 30, color: Colors.white),
              ],
              color: Colors.blue,
              buttonBackgroundColor: Colors.blueGrey,
              backgroundColor: Colors.transparent,
              height: 50,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 500),
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                  if (index == 2) {
                    unreadNotificationCount = 0;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
