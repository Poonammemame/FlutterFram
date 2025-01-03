import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import "package:societysphere/societyModel.dart";

import "aanouncement.dart";

class NoticesUI extends StatefulWidget {
  const NoticesUI({super.key});
  @override
  State createState() => _ToDoAppUI();
}

class _ToDoAppUI extends State {
  FocusNode titleFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();
  FocusNode dateFocusNode = FocusNode();

  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void fetchData() async {
    final snapshots =
        await FirebaseFirestore.instance.collection('announcements').get();
    final data = snapshots.docs
        .map((doc) => SocietyModel(
            id: doc.id,
            title: doc['title'],
            description: doc['description'],
            date: doc['date']))
        .toList();
    setState(() {
      todoCards = data;
    });
  }

  List<SocietyModel> todoCards = [
    // TodoModel(
    //     title: "Scheduled Water Tank Cleaning",
    //     description:
    //         "Please note that water tank cleaning will take place on November 10, 2024, between 9:00 AM and 5:00 PM. Water supply may be interrupted during this time. Kindly store sufficient water in advance.",
    //     date: "Nov 4,2024"),
    // TodoModel(
    //     title: "Monthly Maintenance Due Reminder",
    //     description:
    //         "This is a reminder to all residents that the monthly maintenance fees are due by the 15th of every month. Late payments will incur a fee. Kindly make payments via the society app or at the admin office.",
    //     date: "Nov 1,2024"),
    // TodoModel(
    //     title: "Diwali Celebration Event",
    //     description:
    //         "Join us for the Diwali Celebration in the main garden area on November 12, 2024, at 6:00 PM. There will be games, food stalls, and a cultural program. Dress code: Traditional attire. RSVP on the app by November 2, 2024.",
    //     date: "Oct 27,2024"),
    // TodoModel(
    //     title: "Parking Area Cleaning and Maintenance",
    //     description:
    //         "The parking lot will be closed for maintenance on October 25,2024, from 8:00 AM to 4:00 PM. Kindly remove your vehicles before this time to avoid inconvenience.",
    //     date: "Oct 20,2024"),
  ];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  List<Color> colorList = [
    const Color.fromARGB(255, 251, 216, 216),
    const Color.fromARGB(255, 213, 225, 254),
    const Color.fromARGB(255, 255, 252, 211),
    const Color.fromARGB(255, 253, 209, 253),
  ];

  Color checkColor(int colorIndex) {
    return colorList[colorIndex % colorList.length];
  }

  List<String> imgList = [
    "assets/images/image1.png",
    "assets/images/image2.png",
    "assets/images/image3.png",
    "assets/images/image4.png",
  ];

  Color checkImg(int imgIndex) {
    return colorList[imgIndex % imgList.length];
  }

  void showBottomSheet(bool isEdit, [SocietyModel? todoObj]) {
    if (isEdit && todoObj != null) {
      titleController.text = todoObj.title;
      descriptionController.text = todoObj.description;
      dateController.text = todoObj.date;
    } else {
      clearControllers();
    }
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 12.0,
              right: 12.0,
              left: 12.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Add Notices",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      //color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Notice Title",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: "Quicksand",
                        //color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: titleController,
                      focusNode: titleFocusNode,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              //color: Colors.white,
                              ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12)),
                        //fillColor: Colors.white
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Description of Notice",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: "Quicksand",
                        //color: Colors.white
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: descriptionController,
                      focusNode: descriptionFocusNode,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Date",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: "Quicksand",
                        //color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextField(
                        controller: dateController,
                        focusNode: dateFocusNode,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.calendar_month_outlined,
                              color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2024),
                            lastDate: DateTime(2025),
                          );
                          String formattedDate =
                              DateFormat.yMMMd().format(pickedDate!);
                          setState(() {
                            dateController.text = formattedDate;
                          });
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: 400,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor:
                                        Color.fromARGB(255, 1, 14, 22)),
                                onPressed: () {
                                  submitData(isEdit, todoObj);
                                },
                                child: const Text("Display Notice",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      FocusScope.of(context).requestFocus(titleFocusNode);
    });
  }

  void submitData(bool isEdit, [SocietyModel? todoObj]) {
    print("Data added");
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (isEdit && todoObj != null) {
        FirebaseFirestore.instance
            .collection('announcements')
            .doc(todoObj.id)
            .update({
          'title': titleController.text,
          'description': descriptionController.text,
          'date': dateController.text,
        });
        // todoObj!.title = titleController.text;
        // todoObj.description = descriptionController.text;
        // todoObj.date = dateController.text;
      } else {
        Map<String, dynamic> data = {
          'title': titleController.text,
          'description': descriptionController.text,
          'date': dateController.text,
        };
        FirebaseFirestore.instance.collection('announcements').add(data);
        // todoCards.add(TodoModel(
        //   title: titleController.text,
        //   description: descriptionController.text,
        //   date: dateController.text,
        // ));
      }
      fetchData();
      Navigator.of(context).pop();

      clearControllers();
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please fill all the fields."),
      ));
    }
  }

  void deleteNotice(String id) {
    FirebaseFirestore.instance.collection('announcements').doc(id).delete();
    fetchData();
  }

  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Padding(
      //       padding: const EdgeInsets.only(left: 15),
      //       child: Text("Add Announcements",
      //           style: GoogleFonts.quicksand(
      //               textStyle: const TextStyle(
      //                   fontSize: 26,
      //                   fontWeight: FontWeight.w700,
      //                   color: Colors.white))),
      //     ),
      //     centerTitle: true,
      //     backgroundColor: Color.fromRGBO(62, 1, 68, 1),
      //           ),
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
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80.0, left: 25),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Add Notice",
              style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 37,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150.0, left: 20),
          child: ListView.builder(
            itemCount: todoCards.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 115, 29, 161).withOpacity(0.3),
                        blurRadius: 5.0, // Blur radius
                        offset: Offset(0, 8), // Shadow position
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                                height: 52,
                                width: 52,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Image.asset(
                                  imgList[index % imgList.length],
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(todoCards[index].title,
                                      style: GoogleFonts.quicksand(
                                          textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ))),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(todoCards[index].description,
                                      style: GoogleFonts.quicksand(
                                          textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(84, 84, 84, 1),
                                      ))),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text(todoCards[index].date,
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ))),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                // titleController.text = todoCards[index].title;
                                // descriptionController.text =
                                //     todoCards[index].description;
                                // dateController.text = todoCards[index].date;
                                showBottomSheet(true, todoCards[index]);
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Color.fromRGBO(62, 1, 68, 1),
                              ),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                                child: const Icon(
                                  Icons.delete,
                                  color: Color.fromRGBO(62, 1, 68, 1),
                                ),
                                onTap: () {
                                  // todoCards.remove(todoCards[index]);
                                  deleteNotice(todoCards[index].id);
                                  setState(() {});
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // Back button positioned at the top left
        Positioned(
          top: 2, // Adjust based on desired padding from top
          left: 0, // Adjust based on desired padding from left
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                size: 20, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop(); // Navigate back to the previous page
            },
          ),
        ),
      ]),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(false);
        },
        backgroundColor: Color.fromRGBO(29, 82, 216, 1),
        child: const Icon(Icons.add, size: 40, color: Colors.white),
      ),
    );
  }
}
