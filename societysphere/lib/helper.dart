// import 'package:flutter/material.dart';

// class HelperManagementPage extends StatefulWidget {
//   const HelperManagementPage({Key? key}) : super(key: key);

//   @override
//   State<HelperManagementPage> createState() => _HelperManagementPageState();
// }

// class _HelperManagementPageState extends State<HelperManagementPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController contactController = TextEditingController();
//   final TextEditingController workController = TextEditingController();

//   String status = 'Active'; // Default value for dropdown
//   List<Map<String, String>> helpersList = [];

//   // Function to add a new helper to the list
//   void addHelper() {
//     setState(() {
//       helpersList.add({
//         'name': nameController.text,
//         'contact': contactController.text,
//         'work': workController.text,
//         'status': status,
//       });
//     });

//     // Clear input fields after adding
//     nameController.clear();
//     contactController.clear();
//     workController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Curved Design Background
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
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//             ),
//           ),
//           // Helper Management Form
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
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
//                   const SizedBox(height: 70),
//                   const Text(
//                     'Helper Management',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 30),

//                   // Helper's Name Input
//                   const Text(
//                     'Helper Name:',
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                   const SizedBox(height: 5),
//                   TextField(
//                     controller: nameController,
//                     decoration: InputDecoration(
//                       labelText: 'Enter Helper Name',
//                       filled: true,
//                       fillColor: Colors.grey[100],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),

//                   // Helper's Contact Input
//                   const Text(
//                     'Contact Number:',
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                   const SizedBox(height: 5),
//                   TextField(
//                     controller: contactController,
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       labelText: 'Enter Contact Number',
//                       filled: true,
//                       fillColor: Colors.grey[100],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),

//                   // Work Type Input
//                   const Text(
//                     'Work Type:',
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                   const SizedBox(height: 5),
//                   TextField(
//                     controller: workController,
//                     decoration: InputDecoration(
//                       labelText: 'e.g., Cleaning, Cooking, Security',
//                       filled: true,
//                       fillColor: Colors.grey[100],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),

//                   // Dropdown for Status
//                   const Text(
//                     'Helper Status:',
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                   const SizedBox(height: 5),
//                   DropdownButtonFormField<String>(
//                     value: status,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey[100],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     items: ['Active', 'Inactive']
//                         .map((status) => DropdownMenuItem(
//                               value: status,
//                               child: Text(status),
//                             ))
//                         .toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         status = value!;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 20),

//                   // Button to Add Helper
//                   Center(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color.fromARGB(255, 22, 137, 230),
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 50),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onPressed: addHelper,
//                       child: const Text(
//                         'Add Helper',
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   // Displaying List of Helpers
//                   const Text(
//                     'List of Helpers:',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                         fontSize: 18),
//                   ),
//                   const SizedBox(height: 10),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: helpersList.length,
//                     itemBuilder: (context, index) {
//                       final helper = helpersList[index];
//                       return Card(
//                         color: Colors.purple.shade100,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: ListTile(
//                           title: Text(
//                             helper['name']!,
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Contact: ${helper['contact']}'),
//                               Text('Work Type: ${helper['work']}'),
//                               Text('Status: ${helper['status']}'),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Custom Clipper for the Curved Background
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
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class HelperManagementPage extends StatefulWidget {
  const HelperManagementPage({Key? key}) : super(key: key);

  @override
  State<HelperManagementPage> createState() => _HelperManagementPageState();
}

class _HelperManagementPageState extends State<HelperManagementPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController workController = TextEditingController();
  String status = 'Active'; // Default value for dropdown

  List<Map<String, String>> helpersList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final snapshots =
        await FirebaseFirestore.instance.collection('helpers').get();
    final data = snapshots.docs.map((doc) => HelperModel(
          name: doc['name'],
          contact: doc['contact'],
          work: doc['work'],
          status: doc['status'],
        ));
    setState(() {
      helpersList = data.map((model) {
        return {
          'name': model.name,
          'contact': model.contact,
          'work': model.work,
          'status': model.status,
        };
      }).toList();
    });
  }

  void addHelper() async {
    String name = nameController.text.trim();
    String contact = contactController.text.trim();
    String work = workController.text.trim();

    if (name.isEmpty || contact.isEmpty || work.isEmpty) {
      showSnackbar('Please fill all fields');
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('helpers').add({
        'name': name,
        'contact': contact,
        'work': work,
        'status': status,
      });
      nameController.clear();
      contactController.clear();
      workController.clear();

      fetchData();

      showSnackbar('Helper added successfully');
    } catch (e) {
      showSnackbar('Failed to add helper: $e');
    }
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        Padding(
          padding: const EdgeInsets.only(
            top: 60.0,
            left: 20,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text("Helper Management",
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200.0, left: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextField(
                  'Helper Name:',
                  nameController,
                ),
                const SizedBox(height: 15),
                buildTextField('Contact Number:', contactController),
                const SizedBox(height: 15),
                buildTextField('Work Type:', workController),
                const SizedBox(height: 15),
                const Text('Helper Status:', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: DropdownButtonFormField<String>(
                    value: status,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 233, 233, 233),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: ['Active']
                        .map((status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        status = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 34, 72, 186),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: addHelper,
                    child: const Text(
                      'Add Helper',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
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

  Widget buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HelperModel {
  String name;
  String contact;
  String work;
  String status;

  HelperModel({
    required this.name,
    required this.contact,
    required this.work,
    required this.status,
  });
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
