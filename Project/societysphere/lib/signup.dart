import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart'; // For wave design
import 'package:google_fonts/google_fonts.dart';
import 'package:societysphere/loginPage.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RegistrationPage();
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  State createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String role = "User";
  String adminRole = "Secretary";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController societyNameController = TextEditingController();
  final TextEditingController flatNoController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image.asset("assets/building21.png"),

          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/resident6.png",
                  ), // Path to your image
                  fit: BoxFit.cover,
                  // // Ensures the image covers the area
                ),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 104, 126, 192),
                  Color.fromARGB(255, 34, 72, 186)
                ], transform: GradientRotation(12)),
              ),
            ),
          ),
          // Positioned(
          //   bottom: -4,
          //   left: -50,
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       gradient: RadialGradient(
          //         colors: [
          //           Color.fromARGB(255, 104, 126, 192).withOpacity(0.5),
          //           Color.fromARGB(255, 34, 72, 186),
          //         ],
          //         center: Alignment.center,
          //         radius: 0.8,
          //       ),
          //     ),
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 125.0, left: 25),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Register",
                    style: GoogleFonts.lobster(
                      textStyle: TextStyle(
                        shadows: [
                          Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color:
                                  Colors.grey.withOpacity(0.8)), // Blur radius
                        ],
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 34, 72, 186),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 240),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTextField(
                                controller: nameController,
                                label: "Full Name",
                                icon: Icons.person,
                              ),
                              SizedBox(height: 16),
                              buildDropdown(
                                value: role,
                                label: "Role",
                                items: ['Admin', 'User'],
                                onChanged: (String? value) {
                                  setState(() {
                                    role = value!;
                                  });
                                },
                              ),
                              if (role == "Admin") ...[
                                SizedBox(height: 16),
                                buildTextField(
                                  controller: societyNameController,
                                  label: "Society Name",
                                  icon: Icons.home,
                                ),
                                SizedBox(height: 16),
                                buildDropdown(
                                  value: adminRole,
                                  label: "Admin Role",
                                  items: [
                                    'Secretary',
                                    'Treasurer',
                                    'Chairman',
                                    'Auditor',
                                  ],
                                  onChanged: (String? value) {
                                    setState(() {
                                      adminRole = value!;
                                    });
                                  },
                                ),
                              ],
                              SizedBox(height: 16),
                              buildTextField(
                                controller: flatNoController,
                                label: "Flat Number",
                                icon: Icons.apartment,
                              ),
                              if (role == "User") ...[
                                SizedBox(height: 16),
                                buildTextField(
                                  controller: mobileNoController,
                                  label: "Mobile Number",
                                  icon: Icons.phone,
                                  inputType: TextInputType.phone,
                                ),
                              ],
                              SizedBox(height: 24),
                              Center(
                                child: ElevatedButton(
                                  onPressed: _register,
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 64,
                                      vertical: 16,
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 34, 72, 186),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                    );
                                  },
                                  child: const Text(
                                    "Already have an account? Login",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 34, 72, 186),
                                      decoration: TextDecoration.underline,
                                    ),
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
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    IconData? icon,
    TextInputType inputType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null
            ? Icon(icon, color: Color.fromARGB(255, 34, 72, 186))
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      keyboardType: inputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label is required';
        }
        return null;
      },
    );
  }

  Widget buildDropdown({
    required String value,
    required String label,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map((role) => DropdownMenuItem(
                value: role,
                child: Text(role),
              ))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        CollectionReference collection = FirebaseFirestore.instance
            .collection(role == "Admin" ? "Admin" : "Users");
        QuerySnapshot querySnapshot = await collection
            .where("flatNo", isEqualTo: flatNoController.text.trim())
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          final snackBar = SnackBar(
            content: Text(
              'User with this Flat Number already exists!',
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            duration: Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return;
        }

        Map<String, dynamic> data;
        if (role == "Admin") {
          data = {
            'name': nameController.text.trim(),
            'societyName': societyNameController.text.trim(),
            'role': adminRole,
            'flatNo': flatNoController.text.trim(),
          };
          await FirebaseFirestore.instance.collection('Admin').add(data);
        } else {
          data = {
            'name': nameController.text.trim(),
            'flatNo': flatNoController.text.trim(),
            'mobileNo': mobileNoController.text.trim(),
          };
          await FirebaseFirestore.instance.collection('Users').add(data);
        }

        nameController.clear();
        societyNameController.clear();
        flatNoController.clear();
        mobileNoController.clear();

        final snackBar = SnackBar(
          content: Text(
            role == 'Admin'
                ? 'Admin registered successfully. Please login!'
                : 'User registered successfully. Please login!',
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 34, 72, 186),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
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
    }
  }
}
