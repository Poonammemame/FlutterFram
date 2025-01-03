// import "package:cloud_firestore/cloud_firestore.dart";
// import "package:flutter/material.dart";
// import "package:flutter/rendering.dart";
// import "package:google_fonts/google_fonts.dart";
// import "package:societysphere/makebalanceSheet.dart";

// class Showbalancesheet extends StatefulWidget {
//   @override
//   State<Showbalancesheet> createState() => _ShowbalancesheetState();
// }

// class _ShowbalancesheetState extends State<Showbalancesheet> {
//   List<BalanceModel> balance = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchBalanceSheet();
//   }

//   Future<void> fetchBalanceSheet() async {
//     try {
//       final querySnapshot =
//           await FirebaseFirestore.instance.collection('balanceSheet').get();

//       final fetchedBalances = querySnapshot.docs.map((doc) {
//         final balanceData = doc.data() as Map<String, dynamic>;
//         return BalanceModel(
//           month: balanceData['month'] ?? 'No Month',
//           maintenance: balanceData['maintenance'] ?? 'No Maintenance',
//           lastMonthBalance:
//               balanceData['lastMonthBalance'] ?? 'No lastMonthBalances',
//           electricityBill:
//               balanceData['electricityBill'] ?? 'No electricityBill',
//           otherBills: balanceData['otherBills'] ?? 'No otherBills',
//           securitySal: balanceData['securitySal'] ?? 'No Security Sal',
//           id: '',
//         );
//       }).toList();

//       setState(() {
//         balance = fetchedBalances;
//       });
//     } catch (e) {
//       print('Error fetching notices: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //     title: Padding(
//       //       padding: const EdgeInsets.only(left: 15),
//       //       child: Text("Balance Sheet",
//       //           style: GoogleFonts.quicksand(
//       //               textStyle: const TextStyle(
//       //                   fontSize: 26,
//       //                   fontWeight: FontWeight.w700,
//       //                   color: Colors.white)
//       //                   )
//       //                   ),
//       //     ),
//       //     centerTitle: true,
//       //     backgroundColor: Color.fromRGBO(25, 140, 234, 1),
//       //     ),
//       body: Stack(children: [
//         ClipPath(
//           clipper: WaveClipper(),
//           child: Container(
//             height: 250,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 104, 126, 192),
//                   Color.fromARGB(255, 34, 72, 186)
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(
//             top: 60.0,
//             left: 20,
//           ),
//           child: Align(
//             alignment: Alignment.topCenter,
//             child: Text("Balance Sheet",
//                 style: GoogleFonts.quicksand(
//                     textStyle: const TextStyle(
//                         fontSize: 26,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white))),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 110.0, left: 10, right: 20),
//           child: ListView.builder(
//             itemCount: balance.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//                 child: Container(
//                   height: 260,
//                   width: 300,
//                   decoration: BoxDecoration(
//                       // gradient: const LinearGradient(
//                       //         colors: [
//                       //           Color.fromARGB(255, 240, 240, 241),
//                       //           Color.fromARGB(255, 221, 225, 238),
//                       //         ],
//                       //       ),
//                       color: Colors.white.withOpacity(0.90),
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: Colors.black)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(balance[index].month,
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20))),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                     "Total Cost of Liabilities : ${balance[index].electricityBill + balance[index].otherBills + balance[index].securitySal}",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                     "Total Cost of Assets : ${balance[index].lastMonthBalance + balance[index].maintenance}",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                     "Equity : ${(balance[index].lastMonthBalance + balance[index].maintenance) - (balance[index].electricityBill + balance[index].otherBills + balance[index].securitySal)}",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: const TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                               ],
//                             ),
//                             //Spacer(),
//                             Container(
//                               height: 100,
//                               width: 80,
//                               child: Image.asset(
//                                 'assets/images/balance_sheet.png',
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 12,
//                         ),
//                         Row(
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 15),
//                                 Container(
//                                   width: 100,
//                                   height: 28,
//                                   alignment: Alignment.center,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                     color: Colors.blue,
//                                   ),
//                                   child: Text("Assets ",
//                                       style: GoogleFonts.quicksand(
//                                           textStyle: const TextStyle(
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 16,
//                                               color: Colors.white))),
//                                 ),
//                                 Text(
//                                     "Maintenance\n : ${balance[index].maintenance}",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: const TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                                 Text(
//                                     "Last Month \n balance : ${balance[index].lastMonthBalance}",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: const TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                               ],
//                             ),
//                             Spacer(),
//                             // const SizedBox(width: 10,),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   width: 100,
//                                   height: 30,
//                                   alignment: Alignment.center,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                     color: Colors.blue,
//                                   ),
//                                   child: Text("Liabilities  ",
//                                       style: GoogleFonts.quicksand(
//                                           textStyle: const TextStyle(
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 16,
//                                               color: Colors.white))),
//                                 ),
//                                 Text(
//                                     "ELectricity Bill : ${balance[index].electricityBill}",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: const TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                                 Text(
//                                     "Security Salary : ${balance[index].securitySal}",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: const TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                                 Text(
//                                     "Other Bills : ${balance[index].otherBills}",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: const TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         Positioned(
//           top: 10,
//           left: 0,
//           child: IconButton(
//             icon: const Icon(Icons.arrow_back_ios_new_outlined,
//                 size: 20, color: Colors.white),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ),
//       ]),
//     );
//   }
// }

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
//----------------------------------------------------------------------------------------------------------------------------
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Showbalancesheet extends StatefulWidget {
//   @override
//   State<Showbalancesheet> createState() => _ShowbalancesheetState();
// }

// class _ShowbalancesheetState extends State<Showbalancesheet> {
//   List<BalanceModel> balance = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchBalanceSheet();
//   }

//   Future<void> fetchBalanceSheet() async {
//     try {
//       final querySnapshot =
//           await FirebaseFirestore.instance.collection('balanceSheet').get();

//       final fetchedBalances = querySnapshot.docs.map((doc) {
//         final balanceData = doc.data() as Map<String, dynamic>;
//         return BalanceModel(
//           month: balanceData['month'] ?? 'No Month',
//           maintenance: balanceData['maintenance']?.toDouble() ?? 0.0,
//           lastMonthBalance: balanceData['lastMonthBalance']?.toDouble() ?? 0.0,
//           electricityBill: balanceData['electricityBill']?.toDouble() ?? 0.0,
//           otherBills: balanceData['otherBills']?.toDouble() ?? 0.0,
//           securitySal: balanceData['securitySal']?.toDouble() ?? 0.0,
//           id: doc.id, // store document id for reference
//         );
//       }).toList();

//       setState(() {
//         balance = fetchedBalances;
//       });
//     } catch (e) {
//       print('Error fetching balances: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(children: [
//         ClipPath(
//           clipper: WaveClipper(),
//           child: Container(
//             height: 250,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 104, 126, 192),
//                   Color.fromARGB(255, 34, 72, 186)
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 60.0, left: 20),
//           child: Align(
//             alignment: Alignment.topCenter,
//             child: Text("Balance Sheet",
//                 style: GoogleFonts.quicksand(
//                     textStyle: const TextStyle(
//                         fontSize: 26,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white))),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 110.0, left: 10, right: 20),
//           child: ListView.builder(
//             itemCount: balance.length,
//             itemBuilder: (BuildContext context, int index) {
//               final item = balance[index];
//               final totalLiabilities =
//                   item.electricityBill + item.otherBills + item.securitySal;
//               final totalAssets = item.lastMonthBalance + item.maintenance;
//               final equity = totalAssets - totalLiabilities;

//               return Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//                 child: Container(
//                   height: 260,
//                   width: 300,
//                   decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.90),
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: Colors.black)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(item.month,
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20))),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                     "Total Cost of Liabilities : $totalLiabilities",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                                 const SizedBox(height: 5),
//                                 Text("Total Cost of Assets : $totalAssets",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                                 const SizedBox(height: 5),
//                                 Text("Equity : $equity",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: const TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                               ],
//                             ),
//                             Container(
//                               height: 100,
//                               width: 80,
//                               child: Image.asset(
//                                 'assets/images/balance_sheet.png',
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(height: 12),
//                         Row(
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 15),
//                                 Container(
//                                   width: 100,
//                                   height: 28,
//                                   alignment: Alignment.center,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                     color: Colors.blue,
//                                   ),
//                                   child: Text("Assets ",
//                                       style: GoogleFonts.quicksand(
//                                           textStyle: const TextStyle(
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 16,
//                                               color: Colors.white))),
//                                 ),
//                                 Text("Maintenance: ${item.maintenance}",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: const TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                                 Text(
//                                     "Last Month Balance: ${item.lastMonthBalance}",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: const TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                               ],
//                             ),
//                             const Spacer(),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   width: 100,
//                                   height: 30,
//                                   alignment: Alignment.center,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                     color: Colors.blue,
//                                   ),
//                                   child: Text("Liabilities",
//                                       style: GoogleFonts.quicksand(
//                                           textStyle: const TextStyle(
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 16,
//                                               color: Colors.white))),
//                                 ),
//                                 Text(
//                                     "Electricity Bill: ${item.electricityBill}",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: const TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                                 Text("Security Salary: ${item.securitySal}",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: const TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                                 Text("Other Bills: ${item.otherBills}",
//                                     style: GoogleFonts.quicksand(
//                                         textStyle: const TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ))),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         Positioned(
//           top: 10,
//           left: 0,
//           child: IconButton(
//             icon: const Icon(Icons.arrow_back_ios_new_outlined,
//                 size: 20, color: Colors.white),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ),
//       ]),
//     );
//   }
// }

// class BalanceModel {
//   final String month;
//   final double maintenance;
//   final double lastMonthBalance;
//   final double electricityBill;
//   final double otherBills;
//   final double securitySal;
//   final String id;

//   BalanceModel({
//     required this.month,
//     required this.maintenance,
//     required this.lastMonthBalance,
//     required this.electricityBill,
//     required this.otherBills,
//     required this.securitySal,
//     required this.id,
//   });
// }

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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Showbalancesheet extends StatefulWidget {
  @override
  State<Showbalancesheet> createState() => _ShowbalancesheetState();
}

class _ShowbalancesheetState extends State<Showbalancesheet> {
  List<BalanceModel> balance = [];

  @override
  void initState() {
    super.initState();
    fetchBalanceSheet();
  }

  Future<void> fetchBalanceSheet() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('balanceSheet').get();

      final fetchedBalances = querySnapshot.docs.map((doc) {
        final balanceData = doc.data() as Map<String, dynamic>;
        return BalanceModel(
          month: balanceData['month'] ?? 'No Month',
          maintenance: balanceData['maintenance']?.toDouble() ?? 0.0,
          lastMonthBalance: balanceData['lastMonthBalance']?.toDouble() ?? 0.0,
          electricityBill: balanceData['electricityBill']?.toDouble() ?? 0.0,
          otherBills: balanceData['otherBills']?.toDouble() ?? 0.0,
          securitySal: balanceData['securitySal']?.toDouble() ?? 0.0,
          id: doc.id, // store document id for reference
        );
      }).toList();

      setState(() {
        balance = fetchedBalances;
      });
    } catch (e) {
      print('Error fetching balances: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: screenHeight * 0.3, // Set height relative to screen size
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
            padding: EdgeInsets.only(top: screenHeight * 0.08, left: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Balance Sheet",
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    fontSize: screenWidth * 0.065, // Font size based on width
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: screenHeight * 0.12, left: 10, right: 20),
            child: ListView.builder(
              itemCount: balance.length,
              itemBuilder: (BuildContext context, int index) {
                final item = balance[index];
                final totalLiabilities =
                    item.electricityBill + item.otherBills + item.securitySal;
                final totalAssets = item.lastMonthBalance + item.maintenance;
                final equity = totalAssets - totalLiabilities;

                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.07, vertical: 10),
                  child: Container(
                    height:
                        screenHeight * 0.35, // Height based on screen height
                    width: screenWidth * 0.8, // Width based on screen width
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.90),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3, // Flexible to prevent overflow
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.month,
                                      style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenWidth *
                                              0.05, // Font size responsive
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Total Cost of Liabilities : $totalLiabilities",
                                      style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth *
                                              0.035, // Font size responsive
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Total Cost of Assets : $totalAssets",
                                      style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth *
                                              0.035, // Font size responsive
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Equity : $equity",
                                      style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth *
                                              0.035, // Font size responsive
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width:
                                    screenWidth * 0.2, // Image width responsive
                                child: Image.asset(
                                  'assets/images/balance_sheet.png',
                                  fit: BoxFit
                                      .cover, // Ensure image doesn't overflow
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                flex: 3, // Use flexible space
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 15),
                                    Container(
                                      width: screenWidth *
                                          0.25, // Width based on screen width
                                      height: 30,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.blue,
                                      ),
                                      child: Text(
                                        "Assets",
                                        style: GoogleFonts.quicksand(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: screenWidth *
                                                0.04, // Font size responsive
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Maintenance: ${item.maintenance}",
                                      style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth *
                                              0.035, // Font size responsive
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Last Month Balance: ${item.lastMonthBalance}",
                                      style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth *
                                              0.035, // Font size responsive
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                flex: 3, // Use flexible space
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenWidth *
                                          0.25, // Width based on screen width
                                      height: 30,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.blue,
                                      ),
                                      child: Text(
                                        "Liabilities",
                                        style: GoogleFonts.quicksand(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: screenWidth *
                                                0.04, // Font size responsive
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Electricity Bill: ${item.electricityBill}",
                                      style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth *
                                              0.035, // Font size responsive
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Security Salary: ${item.securitySal}",
                                      style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth *
                                              0.035, // Font size responsive
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Other Bills: ${item.otherBills}",
                                      style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth *
                                              0.035, // Font size responsive
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 20,
                color: Colors.white,
              ),
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

class BalanceModel {
  final String month;
  final double maintenance;
  final double lastMonthBalance;
  final double electricityBill;
  final double otherBills;
  final double securitySal;
  final String id;

  BalanceModel({
    required this.month,
    required this.maintenance,
    required this.lastMonthBalance,
    required this.electricityBill,
    required this.otherBills,
    required this.securitySal,
    required this.id,
  });
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
