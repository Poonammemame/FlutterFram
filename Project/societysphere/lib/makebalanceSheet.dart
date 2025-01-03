// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class BalanceSheet extends StatefulWidget {
//   @override
//   State<BalanceSheet> createState() => _BalanceSheetState();
// }

// class _BalanceSheetState extends State<BalanceSheet> {
//   List<BalanceModel> balance = [];
//   TextEditingController monthController = TextEditingController();
//   TextEditingController maintenanceController = TextEditingController();
//   TextEditingController lastMonthBalanceController = TextEditingController();
//   TextEditingController electricityBillController = TextEditingController();
//   TextEditingController otherBillsController = TextEditingController();
//   TextEditingController securitySalaryController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   void fetchData() async {
//     try {
//       final snapshots =
//           await FirebaseFirestore.instance.collection('balanceSheet').get();
//       final data = snapshots.docs
//           .map((doc) => BalanceModel(
//                 id: doc.id,
//                 month: doc['month'],
//                 maintenance: doc['maintenance'],
//                 lastMonthBalance: doc['lastMonthBalance'],
//                 electricityBill: doc['electricityBill'],
//                 otherBills: doc['otherBills'],
//                 securitySal: doc['securitySal'],
//               ))
//           .toList();
//       setState(() {
//         balance = data;
//       });
//     } catch (e) {
//       print("Error fetching data: $e");
//     }
//   }

//   void displayData() {
//     if (monthController.text.trim().isNotEmpty &&
//         maintenanceController.text.trim().isNotEmpty &&
//         lastMonthBalanceController.text.trim().isNotEmpty &&
//         electricityBillController.text.trim().isNotEmpty &&
//         otherBillsController.text.trim().isNotEmpty &&
//         securitySalaryController.text.trim().isNotEmpty) {
//       Map<String, dynamic> balanceData = {
//         'month': monthController.text,
//         'maintenance': int.parse(maintenanceController.text),
//         'lastMonthBalance': int.parse(lastMonthBalanceController.text),
//         'electricityBill': int.parse(electricityBillController.text),
//         'otherBills': int.parse(otherBillsController.text),
//         'securitySal': int.parse(securitySalaryController.text),
//       };
//       FirebaseFirestore.instance.collection('balanceSheet').add(balanceData);
//     }
//     fetchData();
//     clearControllers();
//   }

//   void clearControllers() {
//     monthController.clear();
//     maintenanceController.clear();
//     lastMonthBalanceController.clear();
//     electricityBillController.clear();
//     otherBillsController.clear();
//     securitySalaryController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//                     Color.fromARGB(255, 34, 72, 186),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
// GestureDetector(
//   onTap: () {
//     Navigator.pop(context);
//   },
//   child: const Icon(
//     Icons.arrow_back_ios_new_rounded,
//     color: Colors.white,
//   ),
// ),
// const SizedBox(width: 40),
//                       Text(
//                         "Make Balance Sheet",
//                         style: GoogleFonts.quicksand(
//                           textStyle: const TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     controller: monthController,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: "Enter the month",
//                       hintStyle: const TextStyle(color: Colors.white70),
//                       filled: true,
//                       fillColor: Colors.black26,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: Colors.white),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     controller: maintenanceController,
//                     keyboardType: TextInputType.number,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: "Total amount collected from maintenance",
//                       hintStyle: const TextStyle(color: Colors.white70),
//                       filled: true,
//                       fillColor: Colors.black26,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: Colors.white),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     controller: lastMonthBalanceController,
//                     keyboardType: TextInputType.number,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: "Last month balance",
//                       hintStyle: const TextStyle(color: Colors.white70),
//                       filled: true,
//                       fillColor: Colors.black26,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: Colors.white),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     controller: electricityBillController,
//                     keyboardType: TextInputType.number,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: "Electricity Bill",
//                       hintStyle: const TextStyle(color: Colors.white70),
//                       filled: true,
//                       fillColor: Colors.black26,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: Colors.white),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     controller: otherBillsController,
//                     keyboardType: TextInputType.number,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: "Other Bills",
//                       hintStyle: const TextStyle(color: Colors.white70),
//                       filled: true,
//                       fillColor: Colors.black26,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: Colors.white),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     controller: securitySalaryController,
//                     keyboardType: TextInputType.number,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: "Security Salary",
//                       hintStyle: const TextStyle(color: Colors.white70),
//                       filled: true,
//                       fillColor: Colors.black26,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: Colors.white),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   GestureDetector(
//                     onTap: displayData,
//                     child: Container(
//                       height: 50,
//                       width: double.infinity,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [
//                             Color.fromARGB(255, 104, 126, 192),
//                             Color.fromARGB(255, 34, 72, 186),
//                           ],
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Text("Add Balance Sheet",
//                           style: GoogleFonts.quicksand(
//                               textStyle: const TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ))),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: balance.length,
//                     itemBuilder: (context, index) {
//                       final item = balance[index];
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: Container(
//                           padding: const EdgeInsets.all(15),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: const Color.fromARGB(255, 46, 103, 132),
//                                 offset: const Offset(0, 3),
//                                 blurRadius: 5,
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 item.month,
//                                 style: GoogleFonts.quicksand(
//                                     textStyle: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                 )),
//                               ),
//                               Row(
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text("Maintenance: ${item.maintenance}",
//                                           style: GoogleFonts.quicksand(
//                                               textStyle: const TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ))),
//                                       Text(
//                                           "Last Month Balance: ${item.lastMonthBalance}",
//                                           style: GoogleFonts.quicksand(
//                                               textStyle: const TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ))),
//                                     ],
//                                   ),
//                                   const Spacer(),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                           "Electricity Bill: ${item.electricityBill}",
//                                           style: GoogleFonts.quicksand(
//                                               textStyle: const TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ))),
//                                       Text("Other Bills: ${item.otherBills}",
//                                           style: GoogleFonts.quicksand(
//                                               textStyle: const TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ))),
//                                       Text(
//                                           "Security Salary: ${item.securitySal}",
//                                           style: GoogleFonts.quicksand(
//                                               textStyle: const TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ))),
//                                     ],
//                                   ),
//                                 ],
//                               ),
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

// class BalanceModel {
//   final String id;
//   final String month;
//   final int maintenance;
//   final int lastMonthBalance;
//   final int electricityBill;
//   final int otherBills;
//   final int securitySal;

//   BalanceModel({
//     required this.id,
//     required this.month,
//     required this.maintenance,
//     required this.lastMonthBalance,
//     required this.electricityBill,
//     required this.otherBills,
//     required this.securitySal,
//   });
// }

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, size.height - 50);
//     path.quadraticBezierTo(
//       size.width / 4,
//       size.height,
//       size.width / 2,
//       size.height - 50,
//     );
//     path.quadraticBezierTo(
//       3 * size.width / 4,
//       size.height - 100,
//       size.width,
//       size.height - 50,
//     );
//     path.lineTo(size.width, 0);
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:societysphere/balancemodel.dart';

// class BalanceSheet extends StatefulWidget {
//   @override
//   _BalanceSheetState createState() => _BalanceSheetState();
// }

// class _BalanceSheetState extends State<BalanceSheet> {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController _monthController;
//   late TextEditingController _maintenanceController;
//   late TextEditingController _lastMonthBalanceController;
//   late TextEditingController _electricityBillController;
//   late TextEditingController _otherBillsController;
//   late TextEditingController _securitySalController;

//   @override
//   void initState() {
//     super.initState();
//     _monthController = TextEditingController();
//     _maintenanceController = TextEditingController();
//     _lastMonthBalanceController = TextEditingController();
//     _electricityBillController = TextEditingController();
//     _otherBillsController = TextEditingController();
//     _securitySalController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _monthController.dispose();
//     _maintenanceController.dispose();
//     _lastMonthBalanceController.dispose();
//     _electricityBillController.dispose();
//     _otherBillsController.dispose();
//     _securitySalController.dispose();
//     super.dispose();
//   }

//   Future<void> saveBalanceSheet() async {
//     if (_formKey.currentState!.validate()) {
//       final balanceSheet = BalanceModel(
//         month: _monthController.text,
//         maintenance: double.parse(_maintenanceController.text),
//         lastMonthBalance: double.parse(_lastMonthBalanceController.text),
//         electricityBill: double.parse(_electricityBillController.text),
//         otherBills: double.parse(_otherBillsController.text),
//         securitySal: double.parse(_securitySalController.text),
//         id: '',
//       );

//       try {
//         final docRef = FirebaseFirestore.instance.collection('balanceSheet').doc();
//         await docRef.set({
//           'month': balanceSheet.month,
//           'maintenance': balanceSheet.maintenance,
//           'lastMonthBalance': balanceSheet.lastMonthBalance,
//           'electricityBill': balanceSheet.electricityBill,
//           'otherBills': balanceSheet.otherBills,
//           'securitySal': balanceSheet.securitySal,
//         });
//         Navigator.pop(context);
//       } catch (e) {
//         print('Error saving balance sheet: $e');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Add Balance Sheet')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: _monthController,
//                 decoration: const InputDecoration(labelText: 'Month'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a month';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _maintenanceController,
//                 decoration: const InputDecoration(labelText: 'Maintenance'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the maintenance amount';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _lastMonthBalanceController,
//                 decoration: const InputDecoration(labelText: 'Last Month Balance'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the last month balance';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _electricityBillController,
//                 decoration: const InputDecoration(labelText: 'Electricity Bill'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the electricity bill';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _otherBillsController,
//                 decoration: const InputDecoration(labelText: 'Other Bills'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the other bills';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _securitySalController,
//                 decoration: const InputDecoration(labelText: 'Security Salary'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the security salary';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: saveBalanceSheet,
//                 child: const Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:societysphere/balancemodel.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceSheet extends StatefulWidget {
  @override
  _BalanceSheetState createState() => _BalanceSheetState();
}

class _BalanceSheetState extends State<BalanceSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _monthController;
  late TextEditingController _maintenanceController;
  late TextEditingController _lastMonthBalanceController;
  late TextEditingController _electricityBillController;
  late TextEditingController _otherBillsController;
  late TextEditingController _securitySalController;

  @override
  void initState() {
    super.initState();
    _monthController = TextEditingController();
    _maintenanceController = TextEditingController();
    _lastMonthBalanceController = TextEditingController();
    _electricityBillController = TextEditingController();
    _otherBillsController = TextEditingController();
    _securitySalController = TextEditingController();
  }

  @override
  void dispose() {
    _monthController.dispose();
    _maintenanceController.dispose();
    _lastMonthBalanceController.dispose();
    _electricityBillController.dispose();
    _otherBillsController.dispose();
    _securitySalController.dispose();
    super.dispose();
  }

  Future<void> saveBalanceSheet() async {
    if (_formKey.currentState!.validate()) {
      final balanceSheet = BalanceModel(
        month: _monthController.text,
        maintenance: double.parse(_maintenanceController.text),
        lastMonthBalance: double.parse(_lastMonthBalanceController.text),
        electricityBill: double.parse(_electricityBillController.text),
        otherBills: double.parse(_otherBillsController.text),
        securitySal: double.parse(_securitySalController.text),
        id: '',
      );

      try {
        final docRef =
            FirebaseFirestore.instance.collection('balanceSheet').doc();
        await docRef.set({
          'month': balanceSheet.month,
          'maintenance': balanceSheet.maintenance,
          'lastMonthBalance': balanceSheet.lastMonthBalance,
          'electricityBill': balanceSheet.electricityBill,
          'otherBills': balanceSheet.otherBills,
          'securitySal': balanceSheet.securitySal,
        });
        Navigator.pop(context);
      } catch (e) {
        print('Error saving balance sheet: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
            padding: const EdgeInsets.only(left: 10.0, top: 25),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 40),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("Balance Sheet",
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.white))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0, left: 10, right: 20),
            child: ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _monthController,
                        decoration: const InputDecoration(labelText: 'Month'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a month';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _maintenanceController,
                        decoration:
                            const InputDecoration(labelText: 'Maintenance'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the maintenance amount';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _lastMonthBalanceController,
                        decoration: const InputDecoration(
                            labelText: 'Last Month Balance'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the last month balance';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _electricityBillController,
                        decoration: const InputDecoration(
                            labelText: 'Electricity Bill'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the electricity bill';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _otherBillsController,
                        decoration:
                            const InputDecoration(labelText: 'Other Bills'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the other bills';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _securitySalController,
                        decoration:
                            const InputDecoration(labelText: 'Security Salary'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the security salary';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: saveBalanceSheet,
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),
              ],
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
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
