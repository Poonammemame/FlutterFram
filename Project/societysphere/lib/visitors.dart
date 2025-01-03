// import 'package:flutter/material.dart';

// class VisitorManagementScreen extends StatelessWidget {
//   const VisitorManagementScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       // appBar: AppBar(
//       //   title: const Text("Visitor Management",style:TextStyle(color:Colors.white)),
//       //   backgroundColor: Color.fromARGB(255, 34, 72, 186),
//       //   centerTitle: true,
//       //   elevation: 0,
//       // ),
//       body: Stack(
//         children: [
//           ClipPath(
//             clipper: WaveClipper(),
//             child: Container(
//               height: 250,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color.fromARGB(255, 104, 126, 192),
//                     Color.fromARGB(255, 34, 72, 186)
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//             ),
//           ),
//           // GestureDetector(
//           //   onTap: () {
//           //     Navigator.pop(context);
//           //   },
//           //   child: Container(
//           //     height: 45,
//           //     width: 45,
//           //       decoration:BoxDecoration(
//           //       shape: BoxShape.circle, color: Colors.white),
//           //       child: Icon(Icons.arrow_back, color: Colors.black)),
//           // ),
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Container(
//                         height: 45,
//                         width: 45,
//                         alignment: Alignment.bottomLeft,
//                         child: Icon(Icons.arrow_back_ios_new_rounded,
//                             color: Colors.white)),
//                   ),
//                   const SizedBox(height: 80),
//                   const Text(
//                     "Visitor Pre-Approval",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   VisitorApprovalCard(visitorName: "Karishma"),
//                   VisitorApprovalCard(visitorName: "Samrudhi"),
//                   const SizedBox(height: 20),
//                   const Text(
//                     "Visitor Logs",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   VisitorLogCard(
//                       visitorName: "poonam",
//                       entryTime: "10:00 AM",
//                       status: "Checked In"),
//                   VisitorLogCard(
//                       visitorName: "Aakanksha",
//                       entryTime: "09:30 AM",
//                       status: "Checked Out"),
//                   VisitorLogCard(
//                       visitorName: "geeta",
//                       entryTime: "11:00 AM",
//                       status: "Checked In"),
//                   const SizedBox(height: 20),
//                   const Text(
//                     "Security Alerts",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   SecurityAlertCard(
//                       alertMessage: "Unauthorized Entry Detected"),
//                   SecurityAlertCard(
//                       alertMessage: "Visitor overstayed beyond approved time"),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class VisitorApprovalCard extends StatelessWidget {
//   final String visitorName;

//   const VisitorApprovalCard({required this.visitorName});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         leading: const Icon(Icons.person, color: Colors.blue),
//         title: Text(visitorName),
//         subtitle: const Text("Request for Approval"),
//         trailing: ElevatedButton(
//           onPressed: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("Visitor $visitorName Approved")),
//             );
//           },
//           child: const Text("Approve"),
//         ),
//       ),
//     );
//   }
// }

// class VisitorLogCard extends StatelessWidget {
//   final String visitorName;
//   final String entryTime;
//   final String status;

//   const VisitorLogCard({
//     required this.visitorName,
//     required this.entryTime,
//     required this.status,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         leading: const Icon(Icons.history, color: Colors.orange),
//         title: Text(visitorName),
//         subtitle: Text("Entry Time: $entryTime"),
//         trailing: Text(
//           status,
//           style: TextStyle(
//             color: status == "Checked In" ? Colors.green : Colors.red,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SecurityAlertCard extends StatelessWidget {
//   final String alertMessage;

//   const SecurityAlertCard({required this.alertMessage});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       color: Colors.red[50],
//       child: ListTile(
//         leading: const Icon(Icons.warning, color: Colors.red),
//         title: Text(alertMessage),
//         trailing: ElevatedButton(
//           style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//           onPressed: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("Alert Acknowledged")),
//             );
//           },
//           child: const Text("Acknowledge"),
//         ),
//       ),
//     );
//   }
// }

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height - 40);

//     var firstControlPoint = Offset(size.width / 4, size.height);
//     var firstEndPoint = Offset(size.width / 2, size.height - 40);

//     var secondControlPoint = Offset(3 * size.width / 4, size.height - 80);
//     var secondEndPoint = Offset(size.width, size.height - 40);

//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);

//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondEndPoint.dx, secondEndPoint.dy);

//     path.lineTo(size.width, 0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
                    Color.fromARGB(255, 34, 72, 186)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      alignment: Alignment.bottomLeft,
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  Text(
                    "All Visitors Data",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('visitors')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text('No visitor data found'),
                        );
                      }
                      final visitors = snapshot.data!.docs;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: visitors.length,
                        itemBuilder: (context, index) {
                          final visitor =
                              visitors[index].data() as Map<String, dynamic>;

                          return VisitorLogCard(
                            userId: visitor['userId'] ?? 'Unknown User',
                            visitorName: visitor['visitorName'] ?? 'Unknown',
                            entryTime: visitor['time'] ?? 'Unknown Time',
                            status: visitor['status'] ?? 'Pending',
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          //   Positioned(
          //   top: 2,
          //   left: 0,
          //   child: IconButton(
          //     icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 20,color:Colors.white),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

class VisitorLogCard extends StatelessWidget {
  final String userId;
  final String visitorName;
  final String entryTime;
  final String status;

  const VisitorLogCard({
    required this.userId,
    required this.visitorName,
    required this.entryTime,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.person, color: Colors.blue),
        title: Text(visitorName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Added By: $userId"),
            Text("Time: $entryTime"),
          ],
        ),
        trailing: Text(
          status,
          style: TextStyle(
            color: status == "Approved"
                ? Colors.green
                : (status == "Rejected" ? Colors.red : Colors.orange),
            fontWeight: FontWeight.bold,
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
    path.lineTo(0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 40);

    var secondControlPoint = Offset(3 * size.width / 4, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
