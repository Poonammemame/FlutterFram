import 'package:advancedtodo/TodoModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoAppUI extends StatefulWidget {
  const TodoAppUI({super.key});

  @override
  State<TodoAppUI> createState() => _TodoAppUIState();
}

class _TodoAppUIState extends State<TodoAppUI> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();

  //list of cards
  List<TodoModel> todoCards = [
    TodoModel(
        title: "LP3 Practical Preparation",
        description: "Study the program concepts BCT,ML,DAA",
        date: "17 October 2024"),
    TodoModel(
        title: "LP4 Practical Preparation ",
        description: "Study Cyber Security,Mobile Computing",
        date: "3 November 2024"),
    TodoModel(
        title: "Prepare Report Project ",
        description: "Study on ML Models",
        date: "4 November 2024"),
  ];

  ///list of colors
  List<Color> cardColorsList = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];

  void submit(bool doEdit, [TodoModel? todoObj]) {
    if (titlecontroller.text.trim().isNotEmpty &&
        descriptioncontroller.text.trim().isNotEmpty &&
        datecontroller.text.trim().isNotEmpty) {
      if (doEdit) {
        todoObj!.title = titlecontroller.text;
        todoObj.description = descriptioncontroller.text;
        todoObj.date = datecontroller.text;
      } else {
        todoCards.add(
          TodoModel(
            title: titlecontroller.text,
            description: descriptioncontroller.text,
            date: datecontroller.text,
          ),
        );
      }
    }
    Navigator.of(context).pop();
    clearControllers();
    setState(() {});
  }

  void clearControllers() {
    titlecontroller.clear();
    descriptioncontroller.clear();
    datecontroller.clear();
  }

  void showBottomSheet(bool doEdit, [TodoModel? todoObj]) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 12.0,
                right: 12.0,
                left: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create To-Do",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Text(
                    "Title",
                    style: GoogleFonts.quicksand(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                  TextField(
                    controller: titlecontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(89, 57, 241, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Description",
                    style: GoogleFonts.quicksand(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                  TextField(
                    controller: descriptioncontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(89, 57, 241, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Date",
                    style: GoogleFonts.quicksand(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                  TextField(
                    controller: datecontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(89, 57, 241, 1),
                          ),
                        ),
                        suffixIcon: const Icon(
                          Icons.calendar_month_outlined,
                        )),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2025),
                      );
                      String formattedDate =
                          DateFormat.yMMMd().format(pickedDate!);
                      setState(() {
                        datecontroller.text = formattedDate;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Color.fromRGBO(89, 27, 241, 1))),
                          onPressed: () {
                            if (doEdit == true) {
                              submit(true, todoObj);
                            } else {
                              submit(false);
                            }
                          },
                          child: Text(
                            "Submit",
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )),
                    ),
                  )
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 27, top: 30),
              child: Text(
                "Good Morning",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Text(
                "Poonam",
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                height: 500,
                // width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromRGBO(217, 217, 217, 1),
                ),
                child: Container(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        "CREATE TO DO LIST",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Container(
                          height: 400,
                          width: 600,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                              itemCount: todoCards.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Slidable(
                                    endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 15),
                                              padding: const EdgeInsets.all(8),
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    89, 57, 241, 1),
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 0),
                                                    blurRadius: 10,
                                                    spreadRadius: 0,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.1),
                                                  ),
                                                ],
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  titlecontroller.text =
                                                      todoCards[index].title;
                                                  descriptioncontroller.text =
                                                      todoCards[index]
                                                          .description;
                                                  datecontroller.text =
                                                      todoCards[index].date;

                                                  showBottomSheet(
                                                    true,
                                                    todoCards[index],
                                                  );
                                                  setState(() {});
                                                },
                                                child: const Icon(
                                                  Icons.edit_outlined,
                                                  size: 20,
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 15),
                                              padding: const EdgeInsets.all(8),
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    89, 57, 241, 1),
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 0),
                                                    blurRadius: 10,
                                                    spreadRadius: 0,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.1),
                                                  ),
                                                ],
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  //todoCards.remove(todoCards[index]);
                                                  todoCards.removeAt(index);
                                                  setState(() {});
                                                },
                                                child: const Icon(
                                                  Icons.delete_outlined,
                                                  size: 20,
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      height: 90,
                                      width: 360,
                                      decoration: const BoxDecoration(
                                        //borderRadius: BorderRadius.circular(15),
                                        //color: Colors.amber,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                child: Container(
                                                  width: 52,
                                                  height: 52,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromRGBO(
                                                        217, 217, 217, 1),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: Image.asset(
                                                        "assets/todo.png"),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(todoCards[index].title,
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                    Text(
                                                      todoCards[index]
                                                          .description,
                                                      style: GoogleFonts.inter(
                                                          fontSize: 9,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      todoCards[index].date,
                                                      style: GoogleFonts.inter(
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color.fromRGBO(
                                                              132,
                                                              132,
                                                              132,
                                                              1)),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(false);
        },
        backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
