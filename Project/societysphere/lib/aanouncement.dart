import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:societysphere/societyModel.dart";

class NotificationPage extends StatefulWidget {
  final List<SocietyModel> notices;
  NotificationPage({required this.notices});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> imgList = [
    "assets/images/image1.png",
    "assets/images/image2.png",
    "assets/images/image3.png",
    "assets/images/image4.png",
  ];
  // List<TodoModel> todoCards = [
  //   TodoModel(
  //       title: "Scheduled Water Tank Cleaning",
  //       description:
  //           "Please note that water tank cleaning will take place on November 10, 2024, between 9:00 AM and 5:00 PM. Water supply may be interrupted during this time. Kindly store sufficient water in advance.",
  //       date: "Nov 4,2024"),
  //   TodoModel(
  //       title: "Monthly Maintenance Due Reminder",
  //       description:
  //           "This is a reminder to all residents that the monthly maintenance fees are due by the 15th of every month. Late payments will incur a fee. Kindly make payments via the society app or at the admin office.",
  //       date: "Nov 1,2024"),
  //   TodoModel(
  //       title: "Diwali Celebration Event",
  //       description:
  //           "Join us for the Diwali Celebration in the main garden area on November 12, 2024, at 6:00 PM. There will be games, food stalls, and a cultural program. Dress code: Traditional attire. RSVP on the app by November 2, 2024.",
  //       date: "Oct 27,2024"),
  //   TodoModel(
  //       title: "Parking Area Cleaning and Maintenance",
  //       description:
  //           "The parking lot will be closed for maintenance on October 25,2024, from 8:00 AM to 4:00 PM. Kindly remove your vehicles before this time to avoid inconvenience.",
  //       date: "Oct 20,2024"),
  // ];
  List<SocietyModel> todoCards = [];

  @override
  void initState() {
    super.initState();
    fetchNotices();
  }

  Future<void> fetchNotices() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('announcements').get();

      final fetchedNotices = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return SocietyModel(
          title: data['title'] ?? 'No Title',
          description: data['description'] ?? 'No Description',
          date: data['date'] ?? 'No Date',
          id: '',
        );
      }).toList();

      setState(() {
        todoCards = fetchedNotices;
      });
    } catch (e) {
      print('Error fetching notices: $e');
    }
  }

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
      //     backgroundColor: Color.fromRGBO(3, 46, 115, 1)),
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
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 60.0,
            left: 15,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text("Notice Board",
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white))),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(),
              child:
                  Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 110.0, left: 20, right: 20),
          child: ListView.builder(
            itemCount: todoCards.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Container(
                  width: 150,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.2),
                    border: Border.all(color: Colors.white),
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
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.pop(context);
                      //   },
                      //   child: Container(
                      //       height: 45,
                      //       width: 45,
                      //       decoration: BoxDecoration(
                      //           shape: BoxShape.circle, color: Colors.white),
                      //       child: Icon(Icons.arrow_back, color: Colors.black)),
                      // ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(todoCards[index].title,
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

                      // Centered person illustration placeholder
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
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(todoCards[index].description,
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
                            Text(todoCards[index].date,
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
