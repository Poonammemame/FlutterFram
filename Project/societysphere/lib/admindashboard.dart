import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societysphere/EmergencyNumbers.dart';
import 'package:societysphere/LostFoundPage.dart';
import 'package:societysphere/MembersPage.dart';
import 'package:societysphere/addVisitors.dart';
import 'package:societysphere/analyticsadmin.dart';
import 'package:societysphere/cards.dart';
import 'package:societysphere/complaint.dart';
import 'package:societysphere/facilityManagement.dart';
import 'package:societysphere/helper.dart';
import 'package:societysphere/loginPage.dart';
import 'package:societysphere/makebalanceSheet.dart';
import 'package:societysphere/notices.dart';
import 'package:societysphere/visitors.dart';

class AdminDashBoard extends StatefulWidget {
  final String adminName;
  AdminDashBoard({required this.adminName});
  State createState() => _AdminDashboardScreen();
}

class _AdminDashboardScreen extends State<AdminDashBoard> {
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
      'destination': const NoticesUI(),
    },
    {
      'name': "Facility Management",
      'gradient': const LinearGradient(colors: [
        Colors.blue,
        Color.fromARGB(255, 25, 5, 141),
      ]),
      'imagePath': "assets/facility0.png",
      'destination': const FacilityManagementHome(),
    },
    {
      'name': "Visitors",
      'gradient': const LinearGradient(colors: [
        Colors.green,
        Color.fromARGB(255, 3, 73, 4),
      ]),
      'imagePath': "assets/visitor1.png",
      'destination': const AdminScreen(),
    },
    {
      'name': "Maintainance report",
      'gradient': const LinearGradient(colors: [
        Color.fromARGB(255, 242, 7, 163),
        Color.fromARGB(255, 120, 3, 54),
      ]),
      'imagePath': "assets/balancesheet.png",
      'destination': BalanceSheet(),
    },
  ];

  Widget build(BuildContext context) {
    final filteredFeatures = _features
        .where((feature) =>
            feature['name'].toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 1, 26, 47),
      body: Stack(children: [
        ClipPath(
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
        Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
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
                              color: Colors.white)),
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
                    //     padding: const EdgeInsets.only(top: 60.0),
                    //     child: Container(
                    //       width: 40,
                    //       height: 40,
                    //       decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(10),
                    //           border: Border.all(color: Colors.white)),
                    //       child: const Icon(Icons.logout_outlined,
                    //           color: Colors.blue),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32, left: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 80,
                              // decoration: const BoxDecoration(boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.white,
                              //     blurRadius: 60,
                              //     offset: Offset(0, 4),
                              //   )
                              // ]),
                              child: Image.asset(
                                "assets/profile1.png",
                                width: 85,
                                height: 40,
                              )),
                          const SizedBox(width: 10),
                          Text("Welcome, ${widget.adminName}!",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 35),
                      // Container(
                      //   height: 30,
                      //   width: 350,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(30.0),
                      //     color: Colors.transparent,
                      //     border: Border.all(color: Colors.white),
                      //   ),
                      //   child: const Row(children: [
                      //     Padding(
                      //       padding: EdgeInsets.only(left: 6.0),
                      //       child: Icon(
                      //         Icons.search,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ]),
                      // ),
                      Container(
                        height: 40,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                        ),
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
                        height: 95,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocietyCard(
                            name: "Notices",
                            gradient: const LinearGradient(colors: [
                              Colors.yellow,
                              Color.fromARGB(255, 249, 167, 25)
                            ]),
                            imagePath: "assets/notice2.png",
                            destination: const NoticesUI(),
                          ),
                          const SizedBox(width: 30),
                          SocietyCard(
                            name: "Facility Management",
                            gradient: const LinearGradient(colors: [
                              Colors.blue,
                              Color.fromARGB(255, 25, 5, 141)
                            ]),
                            imagePath: "assets/facility0.png",
                            destination: const FacilityManagementHome(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocietyCard(
                            name: "Visitors",
                            gradient: const LinearGradient(colors: [
                              Colors.green,
                              Color.fromARGB(255, 3, 73, 4)
                            ]),
                            imagePath: "assets/visitor1.png",
                            destination: const AdminScreen(),
                          ),
                          const SizedBox(width: 30),
                          SocietyCard(
                            name: "Maintainance report",
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 242, 7, 163),
                              Color.fromARGB(255, 120, 3, 54)
                            ]),
                            imagePath: "assets/balancesheet.png",
                            destination: BalanceSheet(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocietyCard(
                            name: "Helpers Management",
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 196, 120, 253),
                              Color.fromARGB(255, 70, 1, 88)
                            ]),
                            imagePath: "assets/helper3.png",
                            destination: const HelperManagementPage(),
                          ),
                          const SizedBox(width: 30),
                          SocietyCard(
                            name: "Complaint Management",
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 226, 22, 22),
                              Color.fromARGB(255, 79, 4, 3)
                            ]),
                            imagePath: "assets/complaint1..png",
                            destination: ComplaintScreenApp(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocietyCard(
                            name: "Maintainance Analytics",
                            gradient: const LinearGradient(colors: [
                              Colors.orange,
                              Color.fromARGB(255, 76, 2, 90),
                            ]),
                            imagePath: "assets/report4.png",
                            destination: Showbalancesheets(),
                          ),
                          const SizedBox(width: 30),
                          SocietyCard(
                            name: "Add Visitors",
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 170, 246, 241),
                              Color.fromARGB(255, 6, 132, 152),
                            ]),
                            imagePath: "assets/visitorsadd.png",
                            destination: const AddVisitor(),
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
                              destination: const EmergencyNumbersPage(),
                            ),
                            SocietyCard(
                              name: "Lost & Found",
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 3, 79, 142),
                                Color.fromARGB(255, 85, 5, 146),
                              ]),
                              imagePath: "assets/members.png",
                              destination: LostFoundPage(),
                            ),
                            const SizedBox(height: 70),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 40);

    var secondControlPoint = Offset(3 * size.width / 4, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);

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

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
