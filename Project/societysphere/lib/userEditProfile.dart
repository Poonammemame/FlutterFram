// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // class ProfileScreen extends StatefulWidget {
// //   final String userId; // Pass the registered user's ID to this page

// //   ProfileScreen({required this.userId, required String userName, required String userFlatNo});

// //   @override
// //   _ProfileScreenState createState() => _ProfileScreenState();
// // }

// // class _ProfileScreenState extends State<ProfileScreen> {
// //   final _firestore = FirebaseFirestore.instance;

// //   // Controllers for editable fields
// //   TextEditingController nameController = TextEditingController();
// //   TextEditingController flatNoController = TextEditingController();
// //   TextEditingController phoneController = TextEditingController();

// //   // Fetch user data from Firestore
// //   Future<void> fetchUserData() async {
// //     DocumentSnapshot userDoc =
// //         await _firestore.collection('Users').doc(widget.userId).get();

// //     if (userDoc.exists) {
// //       setState(() {
// //         nameController.text = userDoc['name'] ?? '';
// //         flatNoController.text = userDoc['flatNo'] ?? '';
// //         phoneController.text = userDoc['mobileNo'] ?? '';
// //       });
// //     }
// //   }

// //   // Update user data in Firestore
// //   Future<void> updateUserData() async {
// //     await _firestore.collection('Users').doc(widget.userId).update({
// //       'name': nameController.text,
// //       'flatNo': flatNoController.text,
// //       'mobileNo': phoneController.text,
// //     });

// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text('Profile Updated!')),
// //     );
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchUserData();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             SizedBox(height: 40),
// //             CircleAvatar(
// //               radius: 50,
// //               backgroundImage: AssetImage('assets/profile.png'), // Placeholder image
// //             ),
// //             SizedBox(height: 16),
// //             Text(
// //               'User ID: ${widget.userId}',
// //               style: GoogleFonts.quicksand(
// //                 fontSize: 16,
// //                 fontWeight: FontWeight.w600,
// //                 color: Colors.grey[700],
// //               ),
// //             ),
// //             SizedBox(height: 24),
// //             Card(
// //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     buildEditableField('Name', nameController),
// //                     buildEditableField('Flat No', flatNoController),
// //                     buildEditableField('Phone', phoneController),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 16),
// //             ElevatedButton(
// //               onPressed: updateUserData,
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: Colors.purple,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(16),
// //                 ),
// //               ),
// //               child: Text(
// //                 'Update Profile',
// //                 style: GoogleFonts.quicksand(
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget buildEditableField(String label, TextEditingController controller) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             label,
// //             style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w600),
// //           ),
// //           TextField(
// //             controller: controller,
// //             decoration: InputDecoration(
// //               hintText: 'Enter $label',
// //               hintStyle: GoogleFonts.quicksand(),
// //               border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:societysphere/userProvider.dart';

// // class ProfileScreen extends StatefulWidget {
// //   final String? userId;

// //   ProfileScreen({this.userId});

// //   @override
// //   State<ProfileScreen> createState() => _ProfileScreenState();
// // }

// // class _ProfileScreenState extends State<ProfileScreen> {
// //   Map<String, dynamic>? userData;
// //   bool isLoading = true;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _fetchUserData();
// //   }

// //   Future<void> _fetchUserData() async {
// //     final userId = Provider.of<UserProvider>(context, listen: false).userId;

// //     try {
// //       DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
// //           .collection('Users')
// //           .doc(userId)
// //           .get();

// //       if (userSnapshot.exists) {
// //         setState(() {
// //           userData = userSnapshot.data() as Map<String, dynamic>;
// //           isLoading = false;
// //         });
// //       } else {
// //         setState(() {
// //           isLoading = false;
// //         });
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text('User data not found!')),
// //         );
// //       }
// //     } catch (e) {
// //       setState(() {
// //         isLoading = false;
// //       });
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Error fetching user data: $e')),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Profile')),
// //       body: isLoading
// //           ? const Center(child: CircularProgressIndicator())
// //           : userData == null
// //               ? const Center(child: Text('No user data found'))
// //               : Padding(
// //                   padding: const EdgeInsets.all(16.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text('Name: ${userData!['name'] ?? 'N/A'}',
// //                           style: TextStyle(fontSize: 18)),
// //                       Text('Flat No: ${userData!['flatNo'] ?? 'N/A'}',
// //                           style: TextStyle(fontSize: 18)),
// //                     ],
// //                   ),
// //                 ),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:societysphere/userProvider.dart';

// class ProfileScreen extends StatefulWidget {
//   final String? userId;

//   ProfileScreen({this.userId, required String userName, required String userFlatNo});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   Map<String, dynamic>? userData;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }

//   Future<void> _fetchUserData() async {
//     // Use userId from the widget or fallback to Provider
//     final userId = widget.userId ?? Provider.of<UserProvider>(context, listen: false).userId;

//     // ignore: unrelated_type_equality_checks
//     if (userId == null) {
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('User ID is missing!')),
//       );
//       return;
//     }

//     try {
//       // Fetch user data from Firestore
//       DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
//           .collection('Users')
//           .doc(userId)
//           .get();

//       if (userSnapshot.exists) {
//         setState(() {
//           userData = userSnapshot.data() as Map<String, dynamic>;
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('User data not found!')),
//         );
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching user data: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Profile')),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : userData == null
//               ? const Center(child: Text('No user data found'))
//               : Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Name: ${userData!['name'] ?? 'N/A'}',
//                         style: const TextStyle(fontSize: 18),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         'Flat No: ${userData!['flatNo'] ?? 'N/A'}',
//                         style: const TextStyle(fontSize: 18),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         'Email: ${userData!['email'] ?? 'N/A'}',
//                         style: const TextStyle(fontSize: 18),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         'Phone: ${userData!['phone'] ?? 'N/A'}',
//                         style: const TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//     );
//   }
// }

// EditProfilePage
// class EditProfilePage extends StatefulWidget {
//   final String userId;

//   EditProfilePage({required this.userId});

//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController flatNoController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }

//   void _fetchUserData() async {
//     DocumentSnapshot userData = await FirebaseFirestore.instance
//         .collection('Users')
//         .doc(widget.userId)
//         .get();

//     setState(() {
//       nameController.text = userData['name'];
//       flatNoController.text = userData['flatNo'];
//     });
//   }

//   void _updateProfile() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await FirebaseFirestore.instance.collection('Users').doc(widget.userId).update({
//           'name': nameController.text.trim(),
//           'flatNo': flatNoController.text.trim(),
//         });
//         Navigator.pop(context);
//       } catch (e) {
//         final snackBar = SnackBar(content: Text('Error updating profile: $e'));
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Edit Profile")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: flatNoController,
//                 decoration: InputDecoration(labelText: 'Flat No'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a flat number';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _updateProfile,
//                 child: Text('Update Profile'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class EditProfilePage extends StatefulWidget {
//   final String userId;

//   EditProfilePage({required this.userId});

//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController flatNoController = TextEditingController();
//   final TextEditingController mobileNoController = TextEditingController();

//   void _saveProfile() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await FirebaseFirestore.instance.collection('Users').doc(widget.userId).update({
//           'name': nameController.text.trim(),
//           'flatNo': flatNoController.text.trim(),
//           'mobileNo': mobileNoController.text.trim(),
//         });

//         final snackBar = SnackBar(content: Text('Profile updated successfully!'));
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);

//         Navigator.pop(context); // Go back to ProfilePage
//       } catch (e) {
//         final snackBar = SnackBar(content: Text('Error updating profile: $e'));
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: FirebaseFirestore.instance.collection('Users').doc(widget.userId).get(),
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
//         nameController.text = userData['name'];
//         flatNoController.text = userData['flatNo'];
//         mobileNoController.text = userData['mobileNo'];

//         return Scaffold(
//           appBar: AppBar(title: Text('Edit Profile')),
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: nameController,
//                     decoration: InputDecoration(labelText: 'Name'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: flatNoController,
//                     decoration: InputDecoration(labelText: 'Flat Number'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your flat number';
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: mobileNoController,
//                     decoration: InputDecoration(labelText: 'Mobile Number'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your mobile number';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _saveProfile,
//                     child: Text('Save Changes'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class EditProfilePage extends StatefulWidget {
//   final String userId;

//   EditProfilePage({required this.userId});

//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController flatNoController = TextEditingController();
//   final TextEditingController mobileNoController = TextEditingController();

//   void _saveProfile() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await FirebaseFirestore.instance.collection('Users').doc(widget.userId).update({
//           'name': nameController.text.trim(),
//           'flatNo': flatNoController.text.trim(),
//           'mobileNo': mobileNoController.text.trim(),
//         });

//         final snackBar = SnackBar(content: Text('Profile updated successfully!'));
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);

//         Navigator.pop(context); // Go back to ProfilePage
//       } catch (e) {
//         final snackBar = SnackBar(content: Text('Error updating profile: $e'));
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: FirebaseFirestore.instance.collection('Users').doc(widget.userId).get(),
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
//         nameController.text = userData['name'];
//         flatNoController.text = userData['flatNo'];
//         mobileNoController.text = userData['mobileNo'];

//         return Scaffold(
//           backgroundColor: Colors.white,
//           // appBar: AppBar(
//           //   elevation: 0,
//           //   backgroundColor: Colors.purple,
//           //   title: Text('Edit Profile'),
//           // ),
//           body: Stack(
//             children: [
//               Padding(
//             padding: const EdgeInsets.only(left: 10.0, top: 25),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: const Icon(
//                 Icons.arrow_back_ios_new_rounded,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           const SizedBox(width: 40),
//               Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   elevation: 5,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 20),
//                         child: Column(
//                           children: [
//                             CircleAvatar(
//                               radius: 40,
//                               backgroundImage: AssetImage('assets/profile1.png'), // Replace with actual image URL
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               nameController.text.isEmpty ? 'User Name' : nameController.text,
//                               style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Form(
//                           key: _formKey,
//                           child: Column(
//                             children: [
//                               TextFormField(
//                                 controller: nameController,
//                                 decoration: InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your name';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               SizedBox(height: 10),
//                               TextFormField(
//                                 controller: flatNoController,
//                                 decoration: InputDecoration(labelText: 'Flat Number', border: OutlineInputBorder()),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your flat number';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               SizedBox(height: 10),
//                               TextFormField(
//                                 controller: mobileNoController,
//                                 decoration: InputDecoration(labelText: 'Mobile Number', border: OutlineInputBorder()),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your mobile number';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               SizedBox(height: 20),
//                               ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.blue,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                 ),
//                                 onPressed: _saveProfile,
//                                 child: Text('Update Profile',style: TextStyle(color:Colors.black,fontWeight: FontWeight.w500),),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             ]
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfilePage extends StatefulWidget {
  final String userId;

  EditProfilePage({required this.userId});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController flatNoController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();

  void _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(widget.userId)
            .update({
          'name': nameController.text.trim(),
          'flatNo': flatNoController.text.trim(),
          'mobileNo': mobileNoController.text.trim(),
        });

        final snackBar =
            SnackBar(content: Text('Profile updated successfully!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        Navigator.pop(context); // Go back to ProfilePage
      } catch (e) {
        final snackBar = SnackBar(content: Text('Error updating profile: $e'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('Users')
          .doc(widget.userId)
          .get(),
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
        nameController.text = userData['name'];
        flatNoController.text = userData['flatNo'];
        mobileNoController.text = userData['mobileNo'];

        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 25),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                    'assets/profile1.png'), // Replace with actual image URL
                              ),
                              SizedBox(height: 10),
                              Text(
                                nameController.text.isEmpty
                                    ? 'User Name'
                                    : nameController.text,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      'Quicksand', // Set Quicksand font for text
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      labelText: 'Name',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  controller: flatNoController,
                                  decoration: InputDecoration(
                                      labelText: 'Flat Number',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your flat number';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  controller: mobileNoController,
                                  decoration: InputDecoration(
                                      labelText: 'Mobile Number',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your mobile number';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 30),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: _saveProfile,
                                  child: Text(
                                    'Update Profile',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Quicksand'), // Apply font
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
            ],
          ),
        );
      },
    );
  }
}
