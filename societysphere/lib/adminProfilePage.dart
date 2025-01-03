import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societysphere/adminProfileEdit.dart';
import 'package:societysphere/complaint.dart';
import 'package:societysphere/terms_conditions.dart';
import 'loginPage.dart'; // Import the login page for logout functionality

class AdminProfilePage extends StatelessWidget {
  final String adminId;

  const AdminProfilePage(
      {required this.adminId,
      required String adminName,
      required String adminFlatNo,
      required String societyName,
      required String role});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('Admin').doc(adminId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Center(child: Text('Admin not found'));
        }

        var adminData = snapshot.data!;
        String adminName = adminData['name'];
        String flatNo = adminData['flatNo'];
        String societyName = adminData['societyName'];
        String role = adminData['role'];

        return Scaffold(
          // appBar: AppBar(
          //   title: Text('Admin Profile'),
          // ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/profile1.png'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    adminName,
                    style: GoogleFonts.quicksand(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Flat No: $flatNo',
                    style: GoogleFonts.quicksand(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Society Name: $societyName',
                    style: GoogleFonts.quicksand(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Role: $role',
                    style: GoogleFonts.quicksand(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  SettingsContainer(
                    icon: Icons.edit,
                    title: 'Edit Profile',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditAdminProfile(
                            adminId: adminId,
                            adminName: adminName,
                            adminFlatNo: flatNo,
                            societyName: societyName,
                            role: role,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  SettingsContainer(
                    icon: Icons.description_outlined,
                    title: 'Terms and Conditions',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsOfServicePage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  SettingsContainer(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComplaintScreenApp(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 40),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => LoginScreen()),
                  //     );
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  //     decoration: BoxDecoration(
                  //       gradient: LinearGradient(
                  //         colors: [Colors.blue[300]!, Colors.blue[700]!],
                  //         begin: Alignment.topCenter,
                  //         end: Alignment.bottomCenter,
                  //       ),
                  //       borderRadius: BorderRadius.circular(30),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.black26,
                  //           blurRadius: 5,
                  //           offset: Offset(0, 3),
                  //         ),
                  //       ],
                  //     ),
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         // Use Quicksand font for logout button text
                  //         Text(
                  //           "Logout",
                  //           style: GoogleFonts.quicksand(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 18,
                  //           ),
                  //         ),
                  //         SizedBox(width: 10),
                  //         Icon(
                  //           Icons.arrow_forward,
                  //           color: Colors.white,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  //SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue[300]!, Colors.blue[700]!],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Logout",
                            style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SettingsContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsContainer({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF007AFF),
              size: 28,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: GoogleFonts.quicksand(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
