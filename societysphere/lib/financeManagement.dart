import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:societysphere/societyModel.dart";

class NotificationPage extends StatelessWidget {
  List<String> imgList = [
    "assets/images/image1.png",
    "assets/images/image2.png",
    "assets/images/image3.png",
    "assets/images/image4.png",
  ];
  final List<SocietyModel> notices;

  dynamic todoCards;
  NotificationPage({required this.notices});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Padding(
      //       padding: const EdgeInsets.only(left: 15),
      //       child: Text("Notices",
      //           style: GoogleFonts.quicksand(
      //               textStyle: const TextStyle(
      //                   fontSize: 26,
      //                   fontWeight: FontWeight.w700,
      //                   color: Colors.white))),
      //     ),
      //     centerTitle: true,
      //     backgroundColor: Color.fromRGBO(62, 1, 68, 1)
      // ),
      body: Stack(children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 115, 29, 161),
                  Color.fromRGBO(62, 1, 68, 1)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        ListView.builder(
          itemCount: notices.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Container(
                width: 150,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(38, 2, 41, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25), // Shadow color
                      blurRadius: 20, // Spread of the shadow
                      offset: Offset(0, 5), // Position of the shadow (x, y)
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                          child: Icon(Icons.arrow_back_ios_new_rounded,
                              color: Colors.white)),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(notices[index].title,
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            imgList[index % imgList.length],
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                          )),
                    ),

                    SizedBox(height: 10),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(notices[index].description,
                          style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ))),
                    ),

                    // Title Text
                    // Text(notices[index].description,
                    //                         style: GoogleFonts.quicksand(
                    //                             textStyle: const TextStyle(
                    //                                 fontSize: 14,
                    //                                 fontWeight: FontWeight.w500,
                    //                                 color:Color.fromRGBO(84, 84, 84, 1),
                    //                                 )
                    //                             )
                    //                       ),

                    // Subtitle Text

                    SizedBox(height: 10),

                    // Bottom row with icons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month_outlined,
                              color: Colors.white),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(notices[index].date,
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
      ]),
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
