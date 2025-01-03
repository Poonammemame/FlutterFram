import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:societysphere/aanouncement.dart';
import 'package:societysphere/loginPage.dart';
import 'package:societysphere/terms_conditions.dart';
import 'package:societysphere/userEditProfile.dart';

// class ProfilePage extends StatelessWidget {
//   final String userId;

//    ProfilePage({required this.userId});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: FirebaseFirestore.instance.collection('Users').doc(userId).get(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }

//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }

//         if (!snapshot.hasData) {
//           return Center(child: Text('User not found'));
//         }

//         var userData = snapshot.data!;
//         String userName = userData['name'];
//         String flatNo = userData['flatNo'];
//         String mobileNo = userData['mobileNo'];

//         return Scaffold(
//           body: Padding(
//             padding: const EdgeInsets.all(20),
//             child: SingleChildScrollView(
//               child: Stack(
//                 children: [
//                   Column(
//                   children: [
//                     CircleAvatar(radius: 70, backgroundImage: AssetImage('assets/profile1.png')),
//                     SizedBox(height: 16),
//                     Text(userName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                     SizedBox(height: 8),
//                     Text('Flat No: $flatNo', style: TextStyle(fontSize: 16)),
//                     SizedBox(height: 8),
//                     Text('Mobile No: $mobileNo', style: TextStyle(fontSize: 16)),
//                     SizedBox(height: 20),
//                     SettingsContainer(
//                       icon: Icons.person_outline,
//                       title: 'Edit Profile',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => EditProfilePage(userId: userId),
//                           ),
//                         );
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     SettingsContainer(
//                       icon: Icons.description_outlined,
//                       title: 'Terms and Conditions',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => TermsOfServicePage(),
//                           ),
//                         );
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     SettingsContainer(
//                       icon: Icons.notifications,
//                       title: 'Notifications',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => NotificationPage(notices: [],),
//                           ),
//                         );
//                       },
//                     ),
//                     SizedBox(height: 40),
//                     GestureDetector(
//                         onTap: () {
//                          Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => LoginScreen()));
//                         },
//                         child: Container(
//                 padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.blue[300]!, Colors.blue[700]!],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                   borderRadius: BorderRadius.circular(30),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black26,
//                       blurRadius: 5,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       "Logout",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Icon(
//                       Icons.arrow_forward,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//                         ),
//                       ),
                
//                   ],
//                 ),
//                 ]
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class SettingsContainer extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final VoidCallback onTap;
//   final Color? titleColor;
//   final Color? iconColor;

//   const SettingsContainer({
//     required this.icon,
//     required this.title,
//     required this.onTap,
//     this.titleColor,
//     this.iconColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 10, // Control shadow softness
//               offset: const Offset(0, 4), // Horizontal and Vertical offset
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               color: iconColor ?? const Color(0xFF007AFF),
//               size: 28,
//             ),
//             const SizedBox(width: 16),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: titleColor ?? Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:societysphere/aanouncement.dart';
import 'package:societysphere/loginPage.dart';
import 'package:societysphere/terms_conditions.dart';
import 'package:societysphere/userEditProfile.dart';
import 'package:google_fonts/google_fonts.dart'; // Import the google_fonts package

class ProfilePage extends StatelessWidget {
  final String userId;

  ProfilePage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('Users').doc(userId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return Center(child: Text('User not found'));
        }

        var userData = snapshot.data!;
        String userName = userData['name'];
        String flatNo = userData['flatNo'];
        String mobileNo = userData['mobileNo'];

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      CircleAvatar(radius: 70, backgroundImage: AssetImage('assets/profile1.png')),
                      SizedBox(height: 16),
                      // Use Quicksand font for user name
                      Text(
                        userName,
                        style: GoogleFonts.quicksand(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Use Quicksand font for flat number
                      Text(
                        'Flat No: $flatNo',
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Use Quicksand font for mobile number
                      Text(
                        'Mobile No: $mobileNo',
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20),
                      SettingsContainer(
                        icon: Icons.person_outline,
                        title: 'Edit Profile',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfilePage(userId: userId),
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
                              builder: (context) => NotificationPage(notices: []),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
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
                              // Use Quicksand font for logout button text
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
  final Color? titleColor;
  final Color? iconColor;

  const SettingsContainer({
    required this.icon,
    required this.title,
    required this.onTap,
    this.titleColor,
    this.iconColor,
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
              color: iconColor ?? const Color(0xFF007AFF),
              size: 28,
            ),
            const SizedBox(width: 16),
            // Use Quicksand font for title in settings container
            Text(
              title,
              style: GoogleFonts.quicksand(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: titleColor ?? Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
