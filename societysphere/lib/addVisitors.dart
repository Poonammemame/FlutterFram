import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class AddVisitor extends StatefulWidget {
  const AddVisitor({super.key});

  @override
  State<AddVisitor> createState() => _AddVisitorState();
}

class _AddVisitorState extends State<AddVisitor> {
  final TextEditingController _nameController = TextEditingController();

  void _addVisitor(String name) {
    FirebaseFirestore.instance.collection('visitors').add({
      'name': name,
      'time': DateTime.now().toLocal().toString(),
      'status': 'Pending',
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Visitor added successfully!')),
      );
      _nameController.clear();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding visitor: $error')),
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
          padding: const EdgeInsets.only(top: 60.0, left: 20.0),
          child: Text("Add Visitors",
              style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 500),
        Padding(
          padding: const EdgeInsets.only(top: 250.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Visitor Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  if (_nameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a name')),
                    );
                  } else {
                    _addVisitor(_nameController.text.trim());
                  }
                },
                child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color.fromARGB(255, 34, 72, 186),
                    ),
                    child: Center(
                      child: Text("Add Vistor",
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                    )),
              )
            ],
          ),
        ),
        Positioned(
          top: 2, 
          left: 0, 
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 20,color:Colors.white),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
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
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
