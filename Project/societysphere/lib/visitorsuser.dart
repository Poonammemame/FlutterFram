// import 'package:flutter/material.dart';

// class VisitorCheck extends StatefulWidget {
//   const VisitorCheck({super.key});

//   @override
//   State<VisitorCheck> createState() => _VisitorCheckState();
// }

// class _VisitorCheckState extends State<VisitorCheck> {
//   final TextEditingController _searchController = TextEditingController();

//   List<Map<String, String>> visitors = [
//     {'name': 'Poonam Memane', 'time': '10:30 AM', 'status': 'Checked Out'},
//     {'name': 'Akansha Karwande', 'time': '11:00 AM', 'status': 'Checked Out'},
//     {'name': 'Samruddhi Kulkarni', 'time': '12:15 PM', 'status': 'Checked Out'},
//     {'name': 'Karishma Memane', 'time': '01:00 PM', 'status': 'Checked Out'},
//     {'name': 'Dyneshwari Dhumal', 'time': '02:30 PM', 'status': 'Checked Out'},
//   ];

//   List<Map<String, String>> filteredVisitors = [];
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     filteredVisitors = visitors;
//   }

//   void _searchVisitor(String query) {
//     final filtered = visitors.where((visitor) {
//       return visitor['name']!.toLowerCase().contains(query.toLowerCase());
//     }).toList();

//     setState(() {
//       filteredVisitors = filtered;
//     });
//   }

//   void _updateVisitorStatus(int index, String status) {
//     setState(() {
//       isLoading = true; // Set loading state
//     });

//     Future.delayed(Duration(seconds: 2), () {
//       setState(() {
//         visitors[index]['status'] = status;
//         filteredVisitors = List.from(visitors);
//         isLoading = false; // Reset loading state
//       });
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Visitor status updated to: $status'),
//         duration: const Duration(seconds: 2),
//       ));
//     });
//   }

//   void _toggleCheckInOut(int index) {
//     String currentStatus = visitors[index]['status']!;
//     String newStatus =
//         (currentStatus == 'Checked In') ? 'Checked Out' : 'Checked In';
//     _updateVisitorStatus(index, newStatus);
//   }

//   void _showConfirmationDialog(int index, String action) {
//     String newStatus = action == 'Approved' ? 'Checked In' : 'Checked Out';

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Confirm $action'),
//           content: Text('Are you sure you want to $action this visitor?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text("Cancel"),
//             ),
//             TextButton(
//               onPressed: () {
//                 _updateVisitorStatus(index, newStatus);
//                 Navigator.of(context).pop();
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text('Visitor $action successfully!'),
//                   duration: const Duration(seconds: 2),
//                 ));
//               },
//               child: Text(action),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       // appBar: AppBar(
//       //   title: const Text("Visitor Management"),
//       //   backgroundColor: const Color.fromRGBO(62, 1, 68, 1),
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
//                 ),
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
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
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle, color: Colors.white),
//                         child: Icon(Icons.arrow_back, color: Colors.black)),
//                   ),
//                   const Text(
//                     "Welcome, Society Resident",
//                     style: TextStyle(color: Colors.white, fontSize: 24),
//                   ),
//                   const SizedBox(height: 10),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: TextField(
//                       controller: _searchController,
//                       onChanged: _searchVisitor,
//                       decoration: const InputDecoration(
//                         icon: Icon(
//                           Icons.search,
//                           color: Colors.grey,
//                         ),
//                         border: InputBorder.none,
//                         hintText: "Search Visitors...",
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // Visitor List
//                   filteredVisitors.isEmpty
//                       ? const Center(child: Text('No visitors found'))
//                       : ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: filteredVisitors.length,
//                           itemBuilder: (context, index) {
//                             return Dismissible(
//                               key: Key(filteredVisitors[index]['name']!),
//                               direction: DismissDirection.horizontal,
//                               onDismissed: (direction) {
//                                 String action =
//                                     direction == DismissDirection.startToEnd
//                                         ? 'Approved'
//                                         : 'Rejected';
//                                 _showConfirmationDialog(index, action);
//                               },
//                               background: Container(
//                                 color: Colors.green,
//                                 child: const Icon(Icons.check_circle,
//                                     color: Colors.white),
//                                 alignment: Alignment.centerLeft,
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 20),
//                               ),
//                               secondaryBackground: Container(
//                                 color: Colors.red,
//                                 child: const Icon(Icons.cancel,
//                                     color: Colors.white),
//                                 alignment: Alignment.centerRight,
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 20),
//                               ),
//                               child: VisitorListTile(
//                                 visitor: filteredVisitors[index],
//                                 onCheckInOut: () => _toggleCheckInOut(index),
//                                 onApprove: () =>
//                                     _updateVisitorStatus(index, 'Checked In'),
//                                 onReject: () =>
//                                     _updateVisitorStatus(index, 'Checked Out'),
//                                 isLoading: isLoading,
//                               ),
//                             );
//                           },
//                         ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class VisitorListTile extends StatelessWidget {
//   final Map<String, String> visitor;
//   final VoidCallback onCheckInOut;
//   final VoidCallback onApprove;
//   final VoidCallback onReject;
//   final bool isLoading;

//   const VisitorListTile({
//     Key? key,
//     required this.visitor,
//     required this.onCheckInOut,
//     required this.onApprove,
//     required this.onReject,
//     required this.isLoading,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 5,
//       child: ListTile(
//         contentPadding: const EdgeInsets.all(16),
//         title: Text(
//           visitor['name']!,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text('Arrival Time: ${visitor['time']}'),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               icon: isLoading
//                   ? const CircularProgressIndicator(color: Colors.white)
//                   : const Icon(Icons.check_circle, color: Colors.green),
//               onPressed: isLoading ? null : onApprove,
//               tooltip: 'Approve Visitor',
//             ),
//             IconButton(
//               icon: isLoading
//                   ? const CircularProgressIndicator(color: Colors.white)
//                   : const Icon(Icons.cancel, color: Colors.red),
//               onPressed: isLoading ? null : onReject,
//               tooltip: 'Reject Visitor',
//             ),
//             Checkbox(
//               value: visitor['status'] == 'Checked In',
//               onChanged: (bool? value) {
//                 onCheckInOut();
//               },
//             ),
//           ],
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
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageVisitors extends StatefulWidget {
  const ManageVisitors({super.key});

  @override
  State<ManageVisitors> createState() => _ManageVisitorsState();
}

class _ManageVisitorsState extends State<ManageVisitors> {
  final CollectionReference _visitorsRef =
      FirebaseFirestore.instance.collection('visitors');

  void _updateVisitorStatus(String id, String status) {
    _visitorsRef.doc(id).update({'status': status}).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Visitor status updated to $status')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating status: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0),
          child: Text("Visitor Approval",
              style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.only(top: 150.0, left: 20, right: 20),
          child: StreamBuilder(
            stream: _visitorsRef.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No visitors found'));
              }
              final visitors = snapshot.data!.docs;

              return ListView.builder(
                itemCount: visitors.length,
                itemBuilder: (context, index) {
                  final visitor =
                      visitors[index].data() as Map<String, dynamic>;
                  final visitorId = visitors[index].id;

                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        visitor['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Time: ${visitor['time']}'),
                          Text('Status: ${visitor['status']}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.check_circle,
                                color: Colors.green),
                            onPressed: () =>
                                _updateVisitorStatus(visitorId, 'Approved'),
                          ),
                          IconButton(
                            icon: const Icon(Icons.cancel, color: Colors.red),
                            onPressed: () =>
                                _updateVisitorStatus(visitorId, 'Rejected'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
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
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
