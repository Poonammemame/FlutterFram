// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class FileComplaint extends StatefulWidget {
//   State createState() => Complaint();
// }

// class Complaint extends State {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController flatNo = TextEditingController();
//   TextEditingController topic = TextEditingController();
//   TextEditingController description = TextEditingController();
//   final GlobalKey<FormState> _complaintkey = GlobalKey<FormState>();

//   void fileComplaint() {
//     if (_complaintkey.currentState!.validate()) {
//       Map<String, dynamic> complaintdata = {
//         'name': nameController.text.trim(),
//         'flatNo': flatNo.text.trim(),
//         'topic': topic.text.trim(),
//         'description': description.text.trim(),
//       };
//       FirebaseFirestore.instance.collection("notices").add(complaintdata);
//       nameController.clear();
//       flatNo.clear();
//       topic.clear();
//       description.clear();

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Complaint Registered successfully")),
//       );
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(children: [
//           ClipPath(
//             clipper: WaveClipper(),
//             child: Container(
//               height: 150,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color.fromARGB(255, 104, 126, 192),
//                     Color.fromARGB(255, 34, 72, 186)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 30.0, left: 20.0),
//             child: Text("File Complaint",
//                 style: GoogleFonts.quicksand(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.w600)),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 150.0, left: 20.0, right: 20.0),
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Form(
//                 key: _complaintkey,
//                 child: Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                           height: 45,
//                           width: 45,
//                           alignment: Alignment.bottomLeft,
//                           child: const Icon(Icons.arrow_back_ios_new_rounded,
//                               color: Colors.white)),
//                     ),
//                     SizedBox(height: 30),
//                     TextFormField(
//                       controller: nameController,
//                       decoration: InputDecoration(
//                           labelText: "Name",
//                           labelStyle: GoogleFonts.quicksand(
//                               color: Color.fromARGB(255, 34, 72, 186),
//                               fontWeight: FontWeight.w500),
//                           enabledBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 34, 72, 186),
//                                 style: BorderStyle.solid),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10.0),
//                             ),
//                           ),
//                           focusedBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 34, 72, 186)),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10.0),
//                             ),
//                           ),
//                           fillColor: Colors.white),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter name';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       controller: flatNo,
//                       decoration: InputDecoration(
//                           labelText: "FlatNo",
//                           labelStyle: GoogleFonts.quicksand(
//                               color: Color.fromARGB(255, 34, 72, 186),
//                               fontWeight: FontWeight.w500),
//                           enabledBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 34, 72, 186)),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10.0),
//                             ),
//                           ),
//                           focusedBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 34, 72, 186)),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10.0),
//                             ),
//                           ),
//                           fillColor: Colors.white),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter flatNo';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 30),
//                     TextFormField(
//                       controller: topic,
//                       decoration: InputDecoration(
//                           labelText: "Topic of complaint",
//                           labelStyle: GoogleFonts.quicksand(
//                               color: Color.fromARGB(255, 34, 72, 186),
//                               fontWeight: FontWeight.w500),
//                           enabledBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 34, 72, 186),
//                                 style: BorderStyle.solid),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10.0),
//                             ),
//                           ),
//                           focusedBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 34, 72, 186)),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10.0),
//                             ),
//                           ),
//                           fillColor: Colors.white),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter topic of complaint';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       controller: description,
//                       decoration: InputDecoration(
//                           labelText: "Description of complaint",
//                           labelStyle: GoogleFonts.quicksand(
//                               color: Color.fromARGB(255, 34, 72, 186),
//                               fontWeight: FontWeight.w500),
//                           enabledBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 34, 72, 186)),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10.0),
//                             ),
//                           ),
//                           focusedBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 34, 72, 186)),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10.0),
//                             ),
//                           ),
//                           fillColor: Colors.white),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter complaint description';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 30),
//                     Container(
//                       width: 80,
//                       height: 45,
//                       decoration: BoxDecoration(
//                         border:
//                             Border.all(color: Color.fromARGB(255, 34, 72, 186)),
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       child: GestureDetector(
//                         onTap: fileComplaint,
//                         child: Center(
//                             child: Text("Submit",
//                                 style: GoogleFonts.quicksand(
//                                     color: Color.fromARGB(255, 34, 72, 186),
//                                     fontWeight: FontWeight.w600))),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 15),
//           Positioned(
//             top: 2,
//             left: 0,
//             child: IconButton(
//               icon: const Icon(Icons.arrow_back_ios_new_outlined,
//                   size: 20, color: Colors.white),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height - 40);

//     // Create a wave-like curve
//     var firstControlPoint = Offset(size.width / 4, size.height);
//     var firstEndPoint = Offset(size.width / 2, size.height - 40);

//     var secondControlPoint = Offset(3 * size.width / 4, size.height - 80);
//     var secondEndPoint = Offset(size.width, size.height - 40);

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

//     path.lineTo(size.width, 0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class FileComplaint extends StatefulWidget {
  const FileComplaint({Key? key}) : super(key: key);

  @override
  State<FileComplaint> createState() => _FileComplaintState();
}

class _FileComplaintState extends State<FileComplaint> {
  final GlobalKey<FormState> _complaintkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController flatNo = TextEditingController();
  final TextEditingController topic = TextEditingController();
  final TextEditingController description = TextEditingController();

  void fileComplaint() {
    if (_complaintkey.currentState!.validate()) {
      Map<String, dynamic> complaintdata = {
        'name': nameController.text.trim(),
        'flatNo': flatNo.text.trim(),
        'topic': topic.text.trim(),
        'description': description.text.trim(),
        'status': 'pending', // Add initial status
      };
      FirebaseFirestore.instance.collection("notices").add(complaintdata);
      nameController.clear();
      flatNo.clear();
      topic.clear();
      description.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Complaint Registered successfully")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 104, 126, 192),
                    Color.fromARGB(255, 34, 72, 186),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 45,
              width: 45,
              alignment: Alignment.bottomLeft,
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Text(
              "File Complaint",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250, left: 10, right: 10),
            child: Form(
              key: _complaintkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: GoogleFonts.quicksand(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: flatNo,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Flat Number",
                      labelStyle: GoogleFonts.quicksand(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      prefixIcon: const Icon(
                        Icons.house,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Flat Number";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: topic,
                    decoration: InputDecoration(
                      labelText: "Topic",
                      labelStyle: GoogleFonts.quicksand(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      prefixIcon: const Icon(
                        Icons.topic,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Topic";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: description,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "Description",
                      labelStyle: GoogleFonts.quicksand(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      prefixIcon: const Icon(
                        Icons.description,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Description";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 45,
                    width: 140,
                    child: ElevatedButton(
                      onPressed: fileComplaint,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: const Color.fromARGB(255, 34, 72, 186),
                      ),
                      child: Text(
                        "Register",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
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
