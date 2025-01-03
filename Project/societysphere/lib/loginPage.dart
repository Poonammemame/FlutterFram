// import 'package:flutter/material.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:societysphere/AdminNavigation.dart';
// import 'package:societysphere/UserNavigation.dart';
// import 'package:societysphere/adminBottomNavigation.dart';
// import 'package:societysphere/signup.dart';
// import 'package:societysphere/userBottomNavigation.dart';
// import 'package:societysphere/userEditProfile.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController flatNoController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   void _login() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         QuerySnapshot adminSnapshot = await FirebaseFirestore.instance
//             .collection('Admin')
//             .where('flatNo', isEqualTo: flatNoController.text.trim())
//             .where('name', isEqualTo: nameController.text.trim())
//             .get();

//         QuerySnapshot userSnapshot = await FirebaseFirestore.instance
//             .collection('Users')
//             .where('flatNo', isEqualTo: flatNoController.text.trim())
//             .where('name', isEqualTo: nameController.text.trim())
//             .get();

//         if (adminSnapshot.docs.isNotEmpty) {
//         // Pass adminId and details
//         String adminId = adminSnapshot.docs.first.id;
//         String adminName = adminSnapshot.docs.first['name'];
//         String adminFlatNo = adminSnapshot.docs.first['flatNo'];
//         String societyName = adminSnapshot.docs.first['societyName'];
//         String role = adminSnapshot.docs.first['role'];

//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Adminbottomnavigation(
//               adminId: adminId,
//               adminName: adminName,
//               adminFlatNo: adminFlatNo,
//               societyName: societyName,
//               role: role,
//             ),
//           ),
//         );
//       } else if (userSnapshot.docs.isNotEmpty) {
//           String userId = userSnapshot.docs.first.id; // Fetch userId
//           String userName = userSnapshot.docs.first['name'];
//           String userFlatNo = userSnapshot.docs.first['flatNo'];

//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CurvedNavBar(
//                 userId: userId,
//                 username: userName,
//                 flatNo: userFlatNo,
//               ),
//             ),
//           );

//           // Pass to ProfileScreen
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(
//           //     builder: (context) => ProfileScreen(
//           //       userId: userId,
//           //       userName: userName,
//           //       userFlatNo: userFlatNo,
//           //     ),
//           //   ),
//           // );
//         } else {
//           final snackBar = SnackBar(
//             content: Text(
//               'Invalid Name or Flat Number!',
//               style: GoogleFonts.quicksand(
//                 textStyle: const TextStyle(
//                   color: Colors.red,
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//             backgroundColor: Colors.white,
//             duration: Duration(seconds: 3),
//           );
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         }
//       } catch (e) {
//         final snackBar = SnackBar(
//           content: Text(
//             'An error occurred: $e',
//             style: GoogleFonts.quicksand(
//               textStyle: const TextStyle(
//                 color: Colors.red,
//               ),
//             ),
//           ),
//           backgroundColor: Colors.white,
//           duration: Duration(seconds: 3),
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }
//       nameController.clear();
//       flatNoController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height,
//             child: Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: ClipPath(
//                     clipper: WaveClipper(),
//                     child: Container(
//                       height: MediaQuery.of(context).size.height * 0.4,
//                       decoration: const BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Color.fromARGB(255, 162, 162, 228),
//                             Color.fromRGBO(9, 19, 156, 1),
//                           ],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Login",
//                           style: GoogleFonts.lobster(
//                             textStyle: TextStyle(
//                                 fontSize: 40,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 34, 72, 186),
//                                 shadows: [
//                                   Shadow(
//                                       offset: Offset(2.0, 2.0),
//                                       blurRadius: 3.0,
//                                       color: Colors.grey.withOpacity(0.8)),
//                                 ]),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         TextFormField(
//                           controller: nameController,
//                           decoration: InputDecoration(
//                             labelText: "Name",
//                             labelStyle:
//                                 TextStyle(color: Color.fromRGBO(9, 19, 156, 1)),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             prefixIcon: const Icon(Icons.person,
//                                 color: Color.fromARGB(255, 34, 72, 186)),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Name is required';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 20),
//                         TextFormField(
//                           controller: flatNoController,
//                           decoration: InputDecoration(
//                             labelText: "Flat Number",
//                             labelStyle: const TextStyle(
//                                 color: Color.fromARGB(255, 34, 72, 186)),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: const BorderSide(
//                                     color: Color.fromARGB(255, 34, 72, 186))),
//                             prefixIcon: const Icon(
//                               Icons.home,
//                               color: Color.fromARGB(255, 34, 72, 186),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Flat Number is required';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 20),
//                         Center(
//                           child: ElevatedButton(
//                             onPressed: _login,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor:
//                                   const Color.fromARGB(255, 34, 72, 186),
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 80, vertical: 15),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(40),
//                               ),
//                             ),
//                             child: Text(
//                               "Login",
//                               style: GoogleFonts.quicksand(
//                                 fontSize: 18,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w900,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height - 130);

//     var firstControlPoint = Offset(size.width * 0.25, size.height - 100);
//     var firstEndPoint = Offset(size.width * 0.5, size.height - 130);

//     var secondControlPoint = Offset(size.width * 0.75, size.height - 130);
//     var secondEndPoint = Offset(size.width, size.height - 100);

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
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:societysphere/AdminNavigation.dart';
import 'package:societysphere/UserNavigation.dart';
import 'package:societysphere/adminBottomNavigation.dart';
import 'package:societysphere/signup.dart';
import 'package:societysphere/userBottomNavigation.dart';
import 'package:societysphere/userEditProfile.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController flatNoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        QuerySnapshot adminSnapshot = await FirebaseFirestore.instance
            .collection('Admin')
            .where('flatNo', isEqualTo: flatNoController.text.trim())
            .where('name', isEqualTo: nameController.text.trim())
            .get();

        QuerySnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .where('flatNo', isEqualTo: flatNoController.text.trim())
            .where('name', isEqualTo: nameController.text.trim())
            .get();

        if (adminSnapshot.docs.isNotEmpty) {
          String adminId = adminSnapshot.docs.first.id;
          String adminName = adminSnapshot.docs.first['name'];
          String adminFlatNo = adminSnapshot.docs.first['flatNo'];
          String societyName = adminSnapshot.docs.first['societyName'];
          String role = adminSnapshot.docs.first['role'];

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Adminbottomnavigation(
                adminId: adminId,
                adminName: adminName,
                adminFlatNo: adminFlatNo,
                societyName: societyName,
                role: role,
              ),
            ),
          );
        } else if (userSnapshot.docs.isNotEmpty) {
          String userId = userSnapshot.docs.first.id;
          String userName = userSnapshot.docs.first['name'];
          String userFlatNo = userSnapshot.docs.first['flatNo'];

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CurvedNavBar(
                userId: userId,
                username: userName,
                flatNo: userFlatNo,
              ),
            ),
          );
        } else {
          final snackBar = SnackBar(
            content: Text(
              'Invalid Name or Flat Number!',
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            duration: Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (e) {
        final snackBar = SnackBar(
          content: Text(
            'An error occurred: $e',
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          duration: Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      nameController.clear();
      flatNoController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipPath(
                          clipper: WaveClipper(),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 162, 162, 228),
                                  Color.fromRGBO(9, 19, 156, 1),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Image.asset(
                            'assets/building71.png', // Replace with your image path
                            height: 240,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: GoogleFonts.lobster(
                            textStyle: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 34, 72, 186),
                                shadows: [
                                  Shadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 3.0,
                                      color: Colors.grey.withOpacity(0.8)),
                                ]),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle:
                                TextStyle(color: Color.fromRGBO(9, 19, 156, 1)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.person,
                                color: Color.fromARGB(255, 34, 72, 186)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: flatNoController,
                          decoration: InputDecoration(
                            labelText: "Flat Number",
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 34, 72, 186)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 34, 72, 186))),
                            prefixIcon: const Icon(
                              Icons.home,
                              color: Color.fromARGB(255, 34, 72, 186),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Flat Number is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 34, 72, 186),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            child: Text(
                              "Login",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 130);

    var firstControlPoint = Offset(size.width * 0.25, size.height - 100);
    var firstEndPoint = Offset(size.width * 0.5, size.height - 130);

    var secondControlPoint = Offset(size.width * 0.75, size.height - 130);
    var secondEndPoint = Offset(size.width, size.height - 100);

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
