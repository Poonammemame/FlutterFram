// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:societysphere/EmergencyNumbers.dart';
// import 'package:societysphere/Facilities.dart';
// import 'package:societysphere/MembersPage.dart';
// import 'package:societysphere/aanouncement.dart';
// import 'package:societysphere/analytics.dart';
// import 'package:societysphere/cards.dart';
// import 'package:societysphere/facilityManagement.dart';
// import 'package:societysphere/loginPage.dart';
// import 'package:societysphere/showbalancesheet.dart';
// import 'package:societysphere/userComplaint.dart';
// import 'package:societysphere/visitorsuser.dart';

// class DashbordPageUser extends StatefulWidget {
//   final String userName;

//   DashbordPageUser({required this.userName});
//   @override
//   State<DashbordPageUser> createState() => _DashbordPageUserState();
// }

// class _DashbordPageUserState extends State<DashbordPageUser> {
//   // int _selectedIndex = 0;

//   // final List<Widget> _pages = [
//   //   NotificationPage(notices: []),
//   //   FacilityManagementHome(),
//   //   ManageVisitors(),
//   //   Showbalancesheet(),
//   // ];

//   // void _onItemTapped(int index) {
//   //   setState(() {
//   //     _selectedIndex = index;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(children: [
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: ClipPath(
//             clipper: WaveClipper(),
//             child: Container(
//               height: 340,
//               decoration: const BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                 Color.fromARGB(255, 104, 126, 192),
//                 Color.fromARGB(255, 34, 72, 186)
//               ])),
//             ),
//           ),
//         ),
//         // _pages[_selectedIndex],
//         SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Container(
//                         height: 45,
//                         width: 45,
//                         alignment: Alignment.bottomLeft,
//                         child: const Icon(Icons.arrow_back_ios_new_rounded,
//                             color: Colors.blue)),
//                   ),
//                   const SizedBox(
//                     width: 300,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => LoginScreen()));
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 55.0),
//                       child: Container(
//                         width: 40,
//                         height: 40,
//                         decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.white)),
//                         child: const Icon(Icons.logout_outlined,
//                             color: Colors.white),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 50, left: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                             height: 80,
//                             decoration: const BoxDecoration(boxShadow: [
//                               BoxShadow(
//                                 color: Colors.blue,
//                                 blurRadius: 100,
//                                 offset: Offset(0, 4),
//                               )
//                             ]),
//                             child: Image.asset(
//                               "assets/profile1.png",
//                               width: 85,
//                               height: 40,
//                             )),
//                         const SizedBox(width: 10),
//                         Text("Welcome ${widget.userName}",
//                             style: GoogleFonts.quicksand(
//                               textStyle: const TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w800,
//                               ),
//                             )),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Container(
//                       height: 36,
//                       width: 350,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30.0),
//                           color: Colors.blue,
//                           border: Border.all(
//                             color: Colors.white,
//                             width: 2,
//                           ),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.blue,
//                               blurRadius: 6,
//                               offset: Offset(10, 10),
//                             )
//                           ]),
//                       child: const Row(children: [
//                         Icon(
//                           Icons.search,
//                           color: Colors.white,
//                         ),
//                       ]),
//                     ),
//                     const SizedBox(
//                       height: 100,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SocietyCard(
//                           name: "Notices",
//                           gradient: const LinearGradient(colors: [
//                             Colors.yellow,
//                             Color.fromARGB(255, 221, 135, 6)
//                           ]),
//                           imagePath: "assets/notice2.png",
//                           destination: NotificationPage(
//                             notices: [],
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         SocietyCard(
//                           name: "Facility Availability",
//                           gradient: const LinearGradient(colors: [
//                             Colors.blue,
//                             Color.fromARGB(255, 25, 5, 141)
//                           ]),
//                           imagePath: "assets/facility0.png",
//                           destination: Facility(),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 70),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SocietyCard(
//                           name: "Visitors Check",
//                           gradient: const LinearGradient(colors: [
//                             Colors.green,
//                             Color.fromARGB(255, 3, 73, 4)
//                           ]),
//                           imagePath: "assets/visitor1.png",
//                           destination: ManageVisitors(),
//                         ),
//                         const SizedBox(width: 8),
//                         SocietyCard(
//                           name: "Maintainance report",
//                           gradient: const LinearGradient(colors: [
//                             Color.fromARGB(255, 242, 7, 163),
//                             Color.fromARGB(255, 120, 3, 54)
//                           ]),
//                           imagePath: "assets/balancesheet.png",
//                           destination: Showbalancesheet(),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 70),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SocietyCard(
//                           name: "File Complaint",
//                           gradient: const LinearGradient(colors: [
//                             Color.fromARGB(255, 226, 22, 22),
//                             Color.fromARGB(255, 79, 4, 3)
//                           ]),
//                           imagePath: "assets/complaint1..png",
//                           destination: FileComplaint(),
//                         ),
//                         const SizedBox(width: 8),
//                         SocietyCard(
//                           name: "Maintainance Analytics",
//                           gradient: const LinearGradient(colors: [
//                             Colors.orange,
//                             Color.fromARGB(255, 76, 2, 90),
//                           ]),
//                           imagePath: "assets/report4.png",
//                           destination: ReportGenerator(),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 70),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 18.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           SocietyCard(
//                             name: "Emergency Numbers",
//                             gradient: const LinearGradient(colors: [
//                               Colors.blue,
//                               Color.fromARGB(255, 196, 120, 253),
//                             ]),
//                             imagePath: "assets/emergency1.png",
//                             destination: EmergencyNumbersPage(),
//                           ),
//                           SocietyCard(
//                             name: "Members List",
//                             gradient: const LinearGradient(colors: [
//                               Color.fromARGB(255, 3, 79, 142),
//                               Color.fromARGB(255, 85, 5, 146),
//                             ]),
//                             imagePath: "assets/members.png",
//                             destination: MembersPage(),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ]),
//       // bottomNavigationBar: BottomNavigationBar(
//       //   backgroundColor: Color.fromARGB(255, 29, 29, 49),
//       //   currentIndex: _selectedIndex,
//       //   onTap: _onItemTapped,
//       //   items: const [
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.home, color: Colors.white),
//       //       label: "Home",
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.settings, color: Colors.white),
//       //       label: "Manage",
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.supervised_user_circle, color: Colors.white),
//       //       label: "Visitors",
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.analytics_outlined, color: Colors.white),
//       //       label: "Reports",
//       //     ),
//       //   ],
//       //   unselectedItemColor: Colors.grey,
//       //   selectedItemColor: Colors.blueAccent,
//       // ),
//     );
//   }
// }

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height - 250);

//     var firstControlPoint = Offset(size.width * 0.25, size.height - 260);
//     var firstEndPoint = Offset(size.width * 0.4, size.height - 180);

//     var secondControlPoint = Offset(size.width * 0.75, size.height);
//     var secondEndPoint = Offset(size.width, size.height - 180);

//     path.quadraticBezierTo(
//       firstControlPoint.dx,
//       firstControlPoint.dy,
//       firstEndPoint.dx,
//       firstEndPoint.dy,
//     );

//     path.quadraticBezierTo(
//       secondControlPoint.dx,
//       secondControlPoint.dy,
//       secondEndPoint.dx,
//       secondEndPoint.dy,
//     );

//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// //--------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societysphere/EmergencyNumbers.dart';
import 'package:societysphere/Facilities.dart';
import 'package:societysphere/LostFoundPage.dart';
import 'package:societysphere/MembersPage.dart';
import 'package:societysphere/aanouncement.dart';
import 'package:societysphere/analytics.dart';
import 'package:societysphere/cards.dart';
import 'package:societysphere/facilityManagement.dart';
import 'package:societysphere/loginPage.dart';
import 'package:societysphere/showbalancesheet.dart';
import 'package:societysphere/userComplaint.dart';
import 'package:societysphere/visitorsuser.dart';

class DashbordPageUser extends StatefulWidget {
  final String userName;

  DashbordPageUser({required this.userName});
  @override
  State<DashbordPageUser> createState() => _DashbordPageUserState();
}

class _DashbordPageUserState extends State<DashbordPageUser> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  final List<Map<String, dynamic>> _features = [
    {
      'name': "Notices",
      'gradient': const LinearGradient(colors: [
        Colors.yellow,
        Color.fromARGB(255, 249, 167, 25),
      ]),
      'imagePath': "assets/notice2.png",
      'destination': NotificationPage(
        notices: [],
      ),
    },
    {
      'name': "Facility Management",
      'gradient': const LinearGradient(colors: [
        Colors.blue,
        Color.fromARGB(255, 25, 5, 141),
      ]),
      'imagePath': "assets/facility0.png",
      'destination': const Facility(),
    },
    {
      'name': "Visitors",
      'gradient': const LinearGradient(colors: [
        Colors.green,
        Color.fromARGB(255, 3, 73, 4),
      ]),
      'imagePath': "assets/visitor1.png",
      'destination': const ManageVisitors(),
    },
    {
      'name': "Maintainance report",
      'gradient': const LinearGradient(colors: [
        Color.fromARGB(255, 242, 7, 163),
        Color.fromARGB(255, 120, 3, 54),
      ]),
      'imagePath': "assets/balancesheet.png",
      'destination': Showbalancesheet(),
    },
  ];
  // int _selectedIndex = 0;

  // final List<Widget> _pages = [
  //   NotificationPage(notices: []),
  //   FacilityManagementHome(),
  //   ManageVisitors(),
  //   Showbalancesheet(),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final filteredFeatures = _features
        .where((feature) =>
            feature['name'].toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 340,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 104, 126, 192),
                Color.fromARGB(255, 34, 72, 186)
              ])),
            ),
          ),
        ),
        // _pages[_selectedIndex],
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 45,
                        width: 45,
                        alignment: Alignment.bottomLeft,
                        child: const Icon(Icons.arrow_back_ios_new_rounded,
                            color: Colors.blue)),
                  ),
                  const SizedBox(
                    width: 300,
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pushReplacement(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => LoginScreen()));
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(top: 55.0),
                  //     child: Container(
                  //       width: 40,
                  //       height: 40,
                  //       decoration: BoxDecoration(
                  //           color: Colors.blue,
                  //           borderRadius: BorderRadius.circular(10),
                  //           border: Border.all(color: Colors.white)),
                  //       child: const Icon(Icons.logout_outlined,
                  //           color: Colors.white),
                  //     ),
                  //   ),
                  // )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 80,
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.blue,
                                blurRadius: 100,
                                offset: Offset(0, 4),
                              )
                            ]),
                            child: Image.asset(
                              "assets/profile1.png",
                              width: 85,
                              height: 40,
                            )),
                        const SizedBox(width: 10),
                        Text("Welcome ${widget.userName}!",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                color: Colors.blue,
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Container(
                    //   height: 36,
                    //   width: 350,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(30.0),
                    //       color: Colors.blue,
                    //       border: Border.all(
                    //         color: Colors.white,
                    //         width: 2,
                    //       ),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.blue,
                    //     blurRadius: 6,
                    //     offset: Offset(10, 10),
                    //   )
                    // ]),
                    //   child: const Row(children: [
                    //     Icon(
                    //       Icons.search,
                    //       color: Colors.white,
                    //     ),
                    //   ]),
                    // ),
                    Container(
                      height: 40,
                      width: 352,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.blue,
                          border: Border.all(color: Colors.white),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.blue,
                              blurRadius: 10,
                              offset: Offset(10, 10),
                            )
                          ]),
                      child: Row(children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 6.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.white70),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(left: 10.0, top: -10),
                            ),
                            onChanged: (query) {
                              setState(() {
                                _searchQuery = query;
                              });
                            },
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocietyCard(
                          name: "Notices",
                          gradient: const LinearGradient(colors: [
                            Colors.yellow,
                            Color.fromARGB(255, 221, 135, 6)
                          ]),
                          imagePath: "assets/notice2.png",
                          destination: NotificationPage(
                            notices: [],
                          ),
                        ),
                        const SizedBox(width: 8),
                        SocietyCard(
                          name: "Facility Availability",
                          gradient: const LinearGradient(colors: [
                            Colors.blue,
                            Color.fromARGB(255, 25, 5, 141)
                          ]),
                          imagePath: "assets/facility0.png",
                          destination: Facility(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocietyCard(
                          name: "Visitors Check",
                          gradient: const LinearGradient(colors: [
                            Colors.green,
                            Color.fromARGB(255, 3, 73, 4)
                          ]),
                          imagePath: "assets/visitor1.png",
                          destination: ManageVisitors(),
                        ),
                        const SizedBox(width: 8),
                        SocietyCard(
                          name: "Maintainance report",
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 242, 7, 163),
                            Color.fromARGB(255, 120, 3, 54)
                          ]),
                          imagePath: "assets/balancesheet.png",
                          destination: Showbalancesheet(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocietyCard(
                          name: "File Complaint",
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 226, 22, 22),
                            Color.fromARGB(255, 79, 4, 3)
                          ]),
                          imagePath: "assets/complaint1..png",
                          destination: FileComplaint(),
                        ),
                        const SizedBox(width: 8),
                        SocietyCard(
                          name: "Maintainance Analytics",
                          gradient: const LinearGradient(colors: [
                            Colors.orange,
                            Color.fromARGB(255, 76, 2, 90),
                          ]),
                          imagePath: "assets/report4.png",
                          destination: ReportGenerator(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 70),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SocietyCard(
                            name: "Emergency Numbers",
                            gradient: const LinearGradient(colors: [
                              Colors.blue,
                              Color.fromARGB(255, 196, 120, 253),
                            ]),
                            imagePath: "assets/emergency1.png",
                            destination: EmergencyNumbersPage(),
                          ),
                          SocietyCard(
                            name: "Lost&Found",
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 3, 79, 142),
                              Color.fromARGB(255, 85, 5, 146),
                            ]),
                            imagePath: "assets/members.png",
                            destination: LostFoundPage(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Color.fromARGB(255, 29, 29, 49),
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home, color: Colors.white),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings, color: Colors.white),
      //       label: "Manage",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.supervised_user_circle, color: Colors.white),
      //       label: "Visitors",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.analytics_outlined, color: Colors.white),
      //       label: "Reports",
      //     ),
      //   ],
      //   unselectedItemColor: Colors.grey,
      //   selectedItemColor: Colors.blueAccent,
      // ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 250);

    var firstControlPoint = Offset(size.width * 0.25, size.height - 260);
    var firstEndPoint = Offset(size.width * 0.4, size.height - 180);

    var secondControlPoint = Offset(size.width * 0.75, size.height);
    var secondEndPoint = Offset(size.width, size.height - 180);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
