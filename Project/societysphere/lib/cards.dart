import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocietyCard extends StatelessWidget {
  final String name;

  final Gradient gradient;
  final String imagePath;
  final Widget destination;

  SocietyCard({
    required this.name,
    required this.gradient,
    required this.imagePath,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      name,
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
            Positioned(
              top: -50,
              child: Image.asset(
                imagePath,
                width: 107,
                height: 125,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
