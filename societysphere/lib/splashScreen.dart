// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:societysphere/signup.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => RegistrationScreen()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 200,
//                   width: 200,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Color.fromARGB(255, 242, 243, 249),
//                         spreadRadius: 2,
//                         blurRadius: 30,
//                         offset: Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: ClipOval(
//                     child: Image.asset(
//                       "assets/images/society.jpg",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                     height: 10), // Adjust space between image and text
//                 Text("Society Sphere",
//                     style: GoogleFonts.lobster(
//                         textStyle: TextStyle(
//                       fontSize: 35,
//                       fontWeight: FontWeight.w900,
//                       //color: Color.fromRGBO(84, 84, 84, 1),
//                     ))),
//                 const SizedBox(height: 5),
//                 Text(
//                     "''Effortless Society Management for a Happier Community.''",
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.lobster(
//                         textStyle: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w900,
//                       color: Color.fromRGBO(84, 84, 84, 1),
//                     ))),
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: ClipPath(
//               clipper: WaveClipper(),
//               child: Container(
//                 height: 600, // Adjust wave height as needed
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color.fromARGB(255, 162, 162, 228),
//                       Color.fromRGBO(9, 19, 156, 1)
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height - 250);

//     var firstControlPoint = Offset(size.width * 0.25, size.height - 180);
//     var firstEndPoint = Offset(size.width * 0.5, size.height - 150);

//     var secondControlPoint = Offset(size.width * 0.75, size.height - 120);
//     var secondEndPoint = Offset(size.width, size.height - 150);

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
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import 'package:societysphere/signup.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegistrationScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 218, 224, 248),
                  Color.fromARGB(255, 162, 181, 232),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Abstract Decorations
          Positioned(
            top: -50,
            left: -50,
            child: Transform.rotate(
              angle: pi / 6,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 214, 214, 255),
                      Color.fromARGB(255, 180, 180, 255),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -80,
            right: -80,
            child: Transform.rotate(
              angle: -pi / 6,
              child: Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 180, 200, 255),
                      Color.fromARGB(255, 150, 170, 255),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          // Centered Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Logo
                ScaleTransition(
                  scale: Tween(begin: 0.9, end: 1.1).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: Curves.easeInOut,
                    ),
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 230, 230, 250),
                          spreadRadius: 2,
                          blurRadius: 30,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/society.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // App Name
                Text(
                  "Society Sphere",
                  style: GoogleFonts.lobster(
                    textStyle: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 34, 72, 186),
                      shadows: [
                        Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Colors.grey.withOpacity(0.8)), // Blur radius
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Tagline
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "'Effortless Society Management for a Happier Community.'",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(84, 84, 84, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

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
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 150);

    var firstControlPoint = Offset(size.width * 0.25, size.height - 100);
    var firstEndPoint = Offset(size.width * 0.5, size.height - 120);

    var secondControlPoint = Offset(size.width * 0.75, size.height - 150);
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
