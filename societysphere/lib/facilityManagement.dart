// import "package:flutter/material.dart";

// class FacilityManagementHome extends StatefulWidget {
//   const FacilityManagementHome({super.key});

//   @override
//   State<FacilityManagementHome> createState() => _FacilityManagementHomeState();
// }

// class _FacilityManagementHomeState extends State<FacilityManagementHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
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
//           SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                       height: 45,
//                       width: 45,
//                       alignment: Alignment.bottomLeft,
//                       child: Icon(Icons.arrow_back_ios_new_rounded,
//                           color: Colors.white)),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(top: 60, left: 16, right: 16),
//                   child: Text(
//                     "Welcome, Resident",
//                     style: TextStyle(color: Colors.white, fontSize: 24),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Facility Reservation",
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       const SizedBox(height: 10),
//                       FacilityReservationCard(facilityName: "Gym"),
//                       FacilityReservationCard(facilityName: "Pool"),
//                       FacilityReservationCard(facilityName: "Party Hall"),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Equipment Status",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 10),
//                       EquipmentStatusCard(
//                           equipmentName: "Treadmill", isAvailable: true),
//                       EquipmentStatusCard(
//                           equipmentName: "Dumbbells", isAvailable: false),
//                       EquipmentStatusCard(
//                           equipmentName: "Rowing Machine", isAvailable: true),
//                     ],
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Usage Logs & Occupancy",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 10),
//                       UsageLogCard(
//                           facilityName: "Gym", occupancy: "5 / 10 Occupied"),
//                       UsageLogCard(
//                           facilityName: "Pool", occupancy: "2 / 8 Occupied"),
//                       UsageLogCard(
//                           facilityName: "Party Hall", occupancy: "Reserved"),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Character Animation at Bottom
//         ],
//       ),
//     );
//   }
// }

// class FacilityReservationCard extends StatelessWidget {
//   final String facilityName;

//   FacilityReservationCard({required this.facilityName});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         title: Text(facilityName),
//         subtitle: const Text("Reserve your slot"),
//         trailing: ElevatedButton(
//           onPressed: () {
//             _selectDateTime(context);
//           },
//           child: const Text("Reserve"),
//         ),
//       ),
//     );
//   }

//   Future<void> _selectDateTime(BuildContext context) async {
//     DateTime? date = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2100),
//     );
//     if (date != null) {
//       TimeOfDay? time = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay.now(),
//       );
//       if (time != null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text("Reserved on $date at ${time.format(context)}")),
//         );
//       }
//     }
//   }
// }

// class EquipmentStatusCard extends StatelessWidget {
//   final String equipmentName;
//   final bool isAvailable;

//   EquipmentStatusCard({required this.equipmentName, required this.isAvailable});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         leading: Icon(
//           Icons.fitness_center,
//           color: isAvailable ? Colors.green : Colors.red,
//         ),
//         title: Text(equipmentName),
//         subtitle: Text(isAvailable ? "Available" : "Under Maintenance"),
//       ),
//     );
//   }
// }

// class UsageLogCard extends StatelessWidget {
//   final String facilityName;
//   final String occupancy;

//   const UsageLogCard({required this.facilityName, required this.occupancy});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         title: Text(facilityName),
//         subtitle: Text("Current Occupancy: $occupancy"),
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
// ------------------------------------------------------------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MaterialApp(home: FacilityManagementHome()));
// }

// class FacilityManagementHome extends StatefulWidget {
//   const FacilityManagementHome({super.key});

//   @override
//   State<FacilityManagementHome> createState() => _FacilityManagementHomeState();
// }

// class _FacilityManagementHomeState extends State<FacilityManagementHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
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
//           SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     height: 45,
//                     width: 45,
//                     alignment: Alignment.bottomLeft,
//                     child: const Icon(Icons.arrow_back_ios_new_rounded,
//                         color: Colors.white),
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(top: 60, left: 16, right: 16),
//                   child: Text(
//                     "Welcome, Resident",
//                     style: TextStyle(color: Colors.white, fontSize: 24),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Facility Reservation",
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       const SizedBox(height: 10),
//                       FacilityReservationCard(facilityName: "Gym"),
//                       FacilityReservationCard(facilityName: "Pool"),
//                       FacilityReservationCard(facilityName: "Party Hall"),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Reserved Data",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 10),
//                       StreamBuilder<QuerySnapshot>(
//                         stream: FirebaseFirestore.instance
//                             .collection('reservations')
//                             .snapshots(),
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.waiting) {
//                             return const Center(
//                                 child: CircularProgressIndicator());
//                           }
//                           if (!snapshot.hasData ||
//                               snapshot.data!.docs.isEmpty) {
//                             return const Center(
//                               child: Text(
//                                 "No reservations yet.",
//                                 style:
//                                     TextStyle(fontSize: 16, color: Colors.grey),
//                               ),
//                             );
//                           }
//                           final reservations = snapshot.data!.docs;
//                           return ListView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: reservations.length,
//                             itemBuilder: (context, index) {
//                               final data = reservations[index].data()
//                                   as Map<String, dynamic>;
//                               return Card(
//                                 margin: const EdgeInsets.only(bottom: 12),
//                                 child: ListTile(
//                                   title: Text(data['facilityName']),
//                                   subtitle: Text(
//                                       "Date: ${data['date']}\nTime: ${data['time']}"),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FacilityReservationCard extends StatelessWidget {
//   final String facilityName;

//   FacilityReservationCard({required this.facilityName});

//   Future<void> _selectDateTime(BuildContext context) async {
//     DateTime? date = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2100),
//     );
//     if (date != null) {
//       TimeOfDay? time = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay.now(),
//       );
//       if (time != null) {
//         final formattedDate =
//             "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
//         final formattedTime = time.format(context);

//         // Save to Firebase
//         await FirebaseFirestore.instance.collection('reservations').add({
//           'facilityName': facilityName,
//           'date': formattedDate,
//           'time': formattedTime,
//         });

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text(
//                   "Reserved $facilityName on $formattedDate at $formattedTime")),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         title: Text(facilityName),
//         subtitle: const Text("Reserve your slot"),
//         trailing: ElevatedButton(
//           onPressed: () {
//             _selectDateTime(context);
//           },
//           child: const Text("Reserve"),
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

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MaterialApp(home: FacilityManagementHome()));
// }

// class FacilityManagementHome extends StatefulWidget {
//   const FacilityManagementHome({super.key});

//   @override
//   State<FacilityManagementHome> createState() => _FacilityManagementHomeState();
// }

// class _FacilityManagementHomeState extends State<FacilityManagementHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
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
//                     Color.fromARGB(255, 34, 72, 186),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 70),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: Text(
//                     "Welcome, Resident",
//                     style: TextStyle(color: Colors.white, fontSize: 24),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Facility Reservation",
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       const SizedBox(height: 10),
//                       FacilityReservationCard(facilityName: "Gym"),
//                       FacilityReservationCard(facilityName: "Pool"),
//                       FacilityReservationCard(facilityName: "Party Hall"),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Equipment Status",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 10),
//                       EquipmentStatusCard(
//                           equipmentName: "Treadmill", isAvailable: true),
//                       EquipmentStatusCard(
//                           equipmentName: "Rowing Machine", isAvailable: false),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Usage Logs",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 10),
//                       UsageLogCard(
//                           facilityName: "Conference Room",
//                           occupancy: "5 out of 10"),
//                       UsageLogCard(
//                           facilityName: "Banquet Hall",
//                           occupancy: "2 out of 50"),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FacilityReservationCard extends StatelessWidget {
//   final String facilityName;

//   FacilityReservationCard({required this.facilityName});

//   Future<void> _selectDateTime(BuildContext context) async {
//     DateTime? date = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2100),
//     );
//     if (date != null) {
//       TimeOfDay? time = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay.now(),
//       );
//       if (time != null) {
//         final formattedDate =
//             "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
//         final formattedTime = time.format(context);

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text(
//                   "Reserved $facilityName on $formattedDate at $formattedTime")),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         title: Text(facilityName),
//         subtitle: const Text("Reserve your slot"),
//         trailing: ElevatedButton(
//           onPressed: () {
//             _selectDateTime(context);
//           },
//           child: const Text("Reserve"),
//         ),
//       ),
//     );
//   }
// }

// class EquipmentStatusCard extends StatelessWidget {
//   final String equipmentName;
//   final bool isAvailable;

//   EquipmentStatusCard({required this.equipmentName, required this.isAvailable});

//   Future<void> _changeStatus(BuildContext context) async {
//     final newStatus = !isAvailable;
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Change Status for $equipmentName"),
//         content:
//             Text("Mark as ${newStatus ? 'Available' : 'Under Maintenance'}?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                     content: Text(
//                         "$equipmentName is now ${newStatus ? 'Available' : 'Under Maintenance'}")),
//               );
//             },
//             child: const Text("Change"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         leading: Icon(
//           Icons.fitness_center,
//           color: isAvailable ? Colors.green : Colors.red,
//         ),
//         title: Text(equipmentName),
//         subtitle: Text(isAvailable ? "Available" : "Under Maintenance"),
//         trailing: ElevatedButton(
//           onPressed: () => _changeStatus(context),
//           child: const Text("Change"),
//         ),
//       ),
//     );
//   }
// }

// class UsageLogCard extends StatelessWidget {
//   final String facilityName;
//   final String occupancy;

//   UsageLogCard({required this.facilityName, required this.occupancy});

//   Future<void> _changeOccupancy(BuildContext context) async {
//     final controller = TextEditingController(text: occupancy);
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Update Occupancy for $facilityName"),
//         content: TextField(
//           controller: controller,
//           keyboardType: TextInputType.text,
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text("Updated Occupancy for $facilityName")),
//               );
//             },
//             child: const Text("Update"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         title: Text(facilityName),
//         subtitle: Text("Occupied: $occupancy"),
//         trailing: ElevatedButton(
//           onPressed: () => _changeOccupancy(context),
//           child: const Text("Change"),
//         ),
//       ),
//     );
//   }
// }

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, size.height - 50);
//     var firstControlPoint = Offset(size.width / 4, size.height);
//     var firstEndPoint = Offset(size.width / 2, size.height - 50);
//     var secondControlPoint = Offset(3 * size.width / 4, size.height - 100);
//     var secondEndPoint = Offset(size.width, size.height - 50);

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

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MaterialApp(home: FacilityManagementHome()));
// }

// class FacilityManagementHome extends StatefulWidget {
//   const FacilityManagementHome({super.key});

//   @override
//   State<FacilityManagementHome> createState() => _FacilityManagementHomeState();
// }

// class _FacilityManagementHomeState extends State<FacilityManagementHome> {
//   // List to hold reserved facilities
//   List<String> reservedFacilities = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
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
//                     Color.fromARGB(255, 34, 72, 186),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 70),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: Text(
//                     "Welcome, Resident",
//                     style: TextStyle(color: Colors.white, fontSize: 24),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Facility Reservation",
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       const SizedBox(height: 10),
//                       FacilityReservationCard(
//                         facilityName: "Gym",
//                         onReserve: _handleReserve,
//                       ),
//                       FacilityReservationCard(
//                         facilityName: "Pool",
//                         onReserve: _handleReserve,
//                       ),
//                       FacilityReservationCard(
//                         facilityName: "Party Hall",
//                         onReserve: _handleReserve,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Equipment Status",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 10),
//                       EquipmentStatusCard(
//                           equipmentName: "Treadmill", isAvailable: true),
//                       EquipmentStatusCard(
//                           equipmentName: "Rowing Machine", isAvailable: false),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Usage Logs",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 10),
//                       UsageLogCard(
//                           facilityName: "Conference Room",
//                           occupancy: "5 out of 10"),
//                       UsageLogCard(
//                           facilityName: "Banquet Hall",
//                           occupancy: "2 out of 50"),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: reservedFacilities.isNotEmpty
//                       ? Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               "Reserved Facilities",
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 10),
//                             ...reservedFacilities
//                                 .map((facility) => Text(facility))
//                                 .toList(),
//                           ],
//                         )
//                       : Container(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Method to handle reservation
//   void _handleReserve(String facility) {
//     setState(() {
//       reservedFacilities.add(facility); // Add the reserved facility
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Reserved $facility")),
//     );
//   }
// }

// class FacilityReservationCard extends StatelessWidget {
//   final String facilityName;
//   final Function(String) onReserve;

//   FacilityReservationCard(
//       {required this.facilityName, required this.onReserve});

//   Future<void> _selectDateTime(BuildContext context) async {
//     DateTime? date = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2100),
//     );
//     if (date != null) {
//       TimeOfDay? time = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay.now(),
//       );
//       if (time != null) {
//         final formattedDate =
//             "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
//         final formattedTime = time.format(context);

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text(
//                   "Reserved $facilityName on $formattedDate at $formattedTime")),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         title: Text(facilityName),
//         subtitle: const Text("Reserve your slot"),
//         trailing: ElevatedButton(
//           onPressed: () {
//             _selectDateTime(context);
//             onReserve(facilityName); // Reserve and update the UI
//           },
//           child: const Text("Reserve"),
//         ),
//       ),
//     );
//   }
// }

// class EquipmentStatusCard extends StatefulWidget {
//   final String equipmentName;
//   bool isAvailable;

//   EquipmentStatusCard({required this.equipmentName, required this.isAvailable});

//   @override
//   _EquipmentStatusCardState createState() => _EquipmentStatusCardState();
// }

// class _EquipmentStatusCardState extends State<EquipmentStatusCard> {
//   void _changeStatus() {
//     setState(() {
//       widget.isAvailable = !widget.isAvailable;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//           content: Text(
//               "${widget.equipmentName} is now ${widget.isAvailable ? 'Available' : 'Under Maintenance'}")),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         leading: Icon(
//           Icons.fitness_center,
//           color: widget.isAvailable ? Colors.green : Colors.red,
//         ),
//         title: Text(widget.equipmentName),
//         subtitle: Text(widget.isAvailable ? "Available" : "Under Maintenance"),
//         trailing: ElevatedButton(
//           onPressed: _changeStatus,
//           child: const Text("Change"),
//         ),
//       ),
//     );
//   }
// }

// class UsageLogCard extends StatefulWidget {
//   final String facilityName;
//   String occupancy;

//   UsageLogCard({required this.facilityName, required this.occupancy});

//   @override
//   _UsageLogCardState createState() => _UsageLogCardState();
// }

// class _UsageLogCardState extends State<UsageLogCard> {
//   final TextEditingController _controller = TextEditingController();

//   void _changeOccupancy() {
//     _controller.text = widget.occupancy;

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Update Occupancy for ${widget.facilityName}"),
//         content: TextField(
//           controller: _controller,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(hintText: "Enter new occupancy"),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 widget.occupancy = _controller.text;
//               });
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                     content: Text(
//                         "Updated Occupancy for ${widget.facilityName}: ${widget.occupancy}")),
//               );
//             },
//             child: const Text("Update"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         title: Text(widget.facilityName),
//         subtitle: Text("Occupied: ${widget.occupancy}"),
//         trailing: ElevatedButton(
//           onPressed: _changeOccupancy,
//           child: const Text("Change"),
//         ),
//       ),
//     );
//   }
// }

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, 0);
//     path.quadraticBezierTo(size.width / 4, size.height / 2, size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// class FacilityManagementHome extends StatefulWidget {
//   const FacilityManagementHome({super.key});

//   @override
//   State<FacilityManagementHome> createState() => _FacilityManagementHomeState();
// }

// class _FacilityManagementHomeState extends State<FacilityManagementHome> {
//   // List to hold reserved facilities with date and time
//   List<Map<String, String>> reservedFacilities = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
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
//                     Color.fromARGB(255, 34, 72, 186),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 70),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: Text(
//                     "Welcome, Resident",
//                     style: TextStyle(color: Colors.white, fontSize: 24),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Facility Reservation",
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       const SizedBox(height: 10),
//                       FacilityReservationCard(
//                         facilityName: "Gym",
//                         onReserve: _handleReserve,
//                       ),
//                       FacilityReservationCard(
//                         facilityName: "Pool",
//                         onReserve: _handleReserve,
//                       ),
//                       FacilityReservationCard(
//                         facilityName: "Party Hall",
//                         onReserve: _handleReserve,
//                       ),
//                     ],
//                   ),
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Equipment Status",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 10),
//                       EquipmentStatusCard(
//                           equipmentName: "Treadmill", isAvailable: true),
//                       EquipmentStatusCard(
//                           equipmentName: "Rowing Machine", isAvailable: false),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Usage Logs",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 10),
//                       UsageLogCard(
//                           facilityName: "Conference Room",
//                           occupancy: "5 out of 10"),
//                       UsageLogCard(
//                           facilityName: "Banquet Hall",
//                           occupancy: "2 out of 50"),
//                     ],
//                   ),
//                 ),
//                 // Display reserved cards with date and time
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: reservedFacilities.isNotEmpty
//                       ? Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               "Reserved Facilities",
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 10),
//                             ...reservedFacilities
//                                 .map((facility) => Text(
//                                       "${facility['name']} reserved on ${facility['date']} at ${facility['time']}",
//                                       style: const TextStyle(fontSize: 16),
//                                     ))
//                                 .toList(),
//                           ],
//                         )
//                       : Container(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Method to handle reservation
//   void _handleReserve(String facility) {
//     setState(() {
//       final currentDateTime = DateTime.now();
//       final formattedDate =
//           "${currentDateTime.year}-${currentDateTime.month.toString().padLeft(2, '0')}-${currentDateTime.day.toString().padLeft(2, '0')}";
//       final formattedTime =
//           "${currentDateTime.hour}:${currentDateTime.minute.toString().padLeft(2, '0')}";
//       reservedFacilities.add({
//         'name': facility,
//         'date': formattedDate,
//         'time': formattedTime,
//       });
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Reserved $facility")),
//     );
//   }
// }

// class FacilityReservationCard extends StatelessWidget {
//   final String facilityName;
//   final Function(String) onReserve;

//   FacilityReservationCard(
//       {required this.facilityName, required this.onReserve});

//   Future<void> _selectDateTime(BuildContext context) async {
//     DateTime? date = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2100),
//     );
//     if (date != null) {
//       TimeOfDay? time = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay.now(),
//       );
//       if (time != null) {
//         final formattedDate =
//             "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
//         final formattedTime = time.format(context);

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text(
//                   "Reserved $facilityName on $formattedDate at $formattedTime")),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         title: Text(facilityName),
//         subtitle: const Text("Reserve your slot"),
//         trailing: ElevatedButton(
//           onPressed: () {
//             _selectDateTime(context);
//             onReserve(facilityName); // Reserve and update the UI
//           },
//           child: const Text("Reserve"),
//         ),
//       ),
//     );
//   }
// }

// class EquipmentStatusCard extends StatefulWidget {
//   final String equipmentName;
//   bool isAvailable;

//   EquipmentStatusCard({required this.equipmentName, required this.isAvailable});

//   @override
//   _EquipmentStatusCardState createState() => _EquipmentStatusCardState();
// }

// class _EquipmentStatusCardState extends State<EquipmentStatusCard> {
//   void _changeStatus() {
//     setState(() {
//       widget.isAvailable = !widget.isAvailable;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//           content: Text(
//               "${widget.equipmentName} is now ${widget.isAvailable ? 'Available' : 'Under Maintenance'}")),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         leading: Icon(
//           Icons.fitness_center,
//           color: widget.isAvailable ? Colors.green : Colors.red,
//         ),
//         title: Text(widget.equipmentName),
//         subtitle: Text(widget.isAvailable ? "Available" : "Under Maintenance"),
//         trailing: ElevatedButton(
//           onPressed: _changeStatus,
//           child: const Text("Change"),
//         ),
//       ),
//     );
//   }
// }

// class UsageLogCard extends StatefulWidget {
//   final String facilityName;
//   String occupancy;

//   UsageLogCard({required this.facilityName, required this.occupancy});

//   @override
//   _UsageLogCardState createState() => _UsageLogCardState();
// }

// class _UsageLogCardState extends State<UsageLogCard> {
//   final TextEditingController _controller = TextEditingController();

//   void _changeOccupancy() {
//     _controller.text = widget.occupancy;

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Update Occupancy for ${widget.facilityName}"),
//         content: TextField(
//           controller: _controller,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(hintText: "Enter new occupancy"),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 widget.occupancy = _controller.text;
//               });
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                     content: Text(
//                         "Updated Occupancy for ${widget.facilityName}: ${widget.occupancy}")),
//               );
//             },
//             child: const Text("Update"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         title: Text(widget.facilityName),
//         subtitle: Text("Occupancy: ${widget.occupancy}"),
//         trailing: ElevatedButton(
//           onPressed: _changeOccupancy,
//           child: const Text("Change"),
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
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(home: FacilityManagementHome()));
}

class FacilityManagementHome extends StatefulWidget {
  const FacilityManagementHome({super.key});

  @override
  State<FacilityManagementHome> createState() => _FacilityManagementHomeState();
}

class _FacilityManagementHomeState extends State<FacilityManagementHome> {
  List<Map<String, String>> reservedFacilities = [];

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
                    Color.fromARGB(255, 34, 72, 186),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Facility Management",
                    style: GoogleFonts.quicksand(
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Facility Reservation",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      FacilityReservationCard(
                        facilityName: "Gym",
                        onReserve: _handleReserve,
                      ),
                      FacilityReservationCard(
                        facilityName: "Pool",
                        onReserve: _handleReserve,
                      ),
                      FacilityReservationCard(
                        facilityName: "Party Hall",
                        onReserve: _handleReserve,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Equipment Status",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      EquipmentStatusCard(
                          equipmentName: "Treadmill", isAvailable: true),
                      EquipmentStatusCard(
                          equipmentName: "Rowing Machine", isAvailable: false),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Usage Logs",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      UsageLogCard(
                          facilityName: "Gym", occupancy: "5 out of 20"),
                      UsageLogCard(
                          facilityName: "Party Hall", occupancy: "2 out of 50"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: reservedFacilities.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Reserved Facilities",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            ...reservedFacilities
                                .map((facility) => Text(
                                      "${facility['name']} reserved on ${facility['date']} at ${facility['time']}",
                                      style: const TextStyle(fontSize: 16),
                                    ))
                                .toList(),
                          ],
                        )
                      : Container(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 2,
            left: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined,
                  size: 20, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _handleReserve(String facility) async {
    var formattedDate;
    var formattedTime;
    setState(() {
      final currentDateTime = DateTime.now();
      formattedDate =
          "${currentDateTime.year}-${currentDateTime.month.toString().padLeft(2, '0')}-${currentDateTime.day.toString().padLeft(2, '0')}";
      formattedTime =
          "${currentDateTime.hour}:${currentDateTime.minute.toString().padLeft(2, '0')}";
      reservedFacilities.add({
        'name': facility,
        'date': formattedDate,
        'time': formattedTime,
      });
    });

    FirebaseFirestore.instance.collection('reservations').add({
      'facility': facility,
      'date': formattedDate,
      'time': formattedTime,
      'timestamp': DateTime.now(),
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Reserved $facility")),
    );
  }
}

class FacilityReservationCard extends StatelessWidget {
  final String facilityName;
  final Function(String) onReserve;

  FacilityReservationCard(
      {required this.facilityName, required this.onReserve});

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (time != null) {
        final formattedDate =
            "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
        final formattedTime = time.format(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  "Reserved $facilityName on $formattedDate at $formattedTime")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(facilityName),
        subtitle: const Text("Reserve your slot"),
        trailing: ElevatedButton(
          onPressed: () {
            _selectDateTime(context);
            onReserve(facilityName);
          },
          child: const Text("Reserve"),
        ),
      ),
    );
  }
}

class EquipmentStatusCard extends StatefulWidget {
  final String equipmentName;
  bool isAvailable;

  EquipmentStatusCard({required this.equipmentName, required this.isAvailable});

  @override
  _EquipmentStatusCardState createState() => _EquipmentStatusCardState();
}

class _EquipmentStatusCardState extends State<EquipmentStatusCard> {
  void _changeStatus() {
    setState(() {
      widget.isAvailable = !widget.isAvailable;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              "${widget.equipmentName} is now ${widget.isAvailable ? 'Available' : 'Under Maintenance'}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          Icons.fitness_center,
          color: widget.isAvailable ? Colors.green : Colors.red,
        ),
        title: Text(widget.equipmentName),
        subtitle: Text(widget.isAvailable ? "Available" : "Under Maintenance"),
        trailing: ElevatedButton(
          onPressed: _changeStatus,
          child: const Text("Change"),
        ),
      ),
    );
  }
}

class UsageLogCard extends StatefulWidget {
  final String facilityName;
  String occupancy;

  UsageLogCard({required this.facilityName, required this.occupancy});

  @override
  _UsageLogCardState createState() => _UsageLogCardState();
}

// class _UsageLogCardState extends State<UsageLogCard> {
//   void _changeOccupancy() {
//     setState(() {
//       widget.occupancy = "6 out of 10";
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Updated occupancy for ${widget.facilityName}")),
//     );
//   }
class _UsageLogCardState extends State<UsageLogCard> {
  final TextEditingController _controller = TextEditingController();

  void _changeOccupancy() {
    _controller.text = widget.occupancy;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update Occupancy for ${widget.facilityName}"),
        content: TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: "Enter new occupancy"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widget.occupancy = _controller.text;
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        "Updated Occupancy for ${widget.facilityName}: ${widget.occupancy}")),
              );
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(widget.facilityName),
        subtitle: Text("Occupancy: ${widget.occupancy}"),
        trailing: ElevatedButton(
          onPressed: _changeOccupancy,
          child: const Text("Change"),
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

    // Create a wave-like curve
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
