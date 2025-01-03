// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // // import 'package:fl_chart/fl_chart.dart';

// // // class ReportGenerator extends StatefulWidget {
// // //   @override
// // //   State<ReportGenerator> createState() => ReportGeneratorState();
// // // }

// // // class ReportGeneratorState extends State<ReportGenerator> {
// // //   List<BalanceModel> balance = [];
// // //   double totalAssets = 0;
// // //   double totalLiabilities = 0;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     fetchBalanceSheet();
// // //   }

// // //   Future<void> fetchBalanceSheet() async {
// // //     try {
// // //       final querySnapshot =
// // //           await FirebaseFirestore.instance.collection('balanceSheet').get();

// // //       final fetchedBalances = querySnapshot.docs.map((doc) {
// // //         final balanceData = doc.data() as Map<String, dynamic>;
// // //         return BalanceModel(
// // //           month: balanceData['month'] ?? 'No Month',
// // //           maintenance: balanceData['maintenance'] ?? 0,
// // //           lastMonthBalance: balanceData['lastMonthBalance'] ?? 0,
// // //           electricityBill: balanceData['electricityBill'] ?? 0,
// // //           otherBills: balanceData['otherBills'] ?? 0,
// // //           securitySal: balanceData['securitySal'] ?? 0,
// // //           id: '',
// // //         );
// // //       }).toList();

// // //       // Calculate totals for assets and liabilities
// // //       double assets = 0;
// // //       double liabilities = 0;
// // //       for (var item in fetchedBalances) {
// // //         assets += item.maintenance + item.lastMonthBalance;
// // //         liabilities +=
// // //             item.electricityBill + item.otherBills + item.securitySal;
// // //       }

// // //       setState(() {
// // //         balance = fetchedBalances;
// // //         totalAssets = assets;
// // //         totalLiabilities = liabilities;
// // //       });
// // //     } catch (e) {
// // //       print('Error fetching balances: $e');
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Stack(
// // //         children: [
// // //           // Wave Background
// // //           ClipPath(
// // //             clipper: WaveClipper(),
// // //             child: Container(
// // //               height: 250,
// // //               decoration: const BoxDecoration(
// // //                 gradient: LinearGradient(
// // //                   colors: [
// // //                     Color.fromARGB(255, 104, 126, 192),
// // //                     Color.fromARGB(255, 34, 72, 186)
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //           Column(
// // //             children: [
// // //               Padding(
// // //                 padding: const EdgeInsets.only(top: 40),
// // //                 child: Text(
// // //                   "Analytics Report",
// // //                   style: GoogleFonts.quicksand(
// // //                       color: Colors.white,
// // //                       fontSize: 24,
// // //                       fontWeight: FontWeight.bold),
// // //                   textAlign: TextAlign.center,
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 80),
// // //               totalAssets > 0 || totalLiabilities > 0
// // //                   ? Padding(
// // //                       padding: const EdgeInsets.symmetric(horizontal: 20),
// // //                       child: AspectRatio(
// // //                         aspectRatio: 1.3,
// // //                         child: PieChart(
// // //                           PieChartData(
// // //                             sections: [
// // //                               PieChartSectionData(
// // //                                 value: totalAssets,
// // //                                 title:
// // //                                     "Assets\n${totalAssets.toStringAsFixed(2)}",
// // //                                 color: Colors.green,
// // //                                 titleStyle: const TextStyle(
// // //                                     color: Colors.white,
// // //                                     fontSize: 8,
// // //                                     fontWeight: FontWeight.bold),
// // //                               ),
// // //                               PieChartSectionData(
// // //                                 value: totalLiabilities,
// // //                                 title:
// // //                                     "Liabilities\n${totalLiabilities.toStringAsFixed(2)}",
// // //                                 color: Colors.red,
// // //                                 titleStyle: const TextStyle(
// // //                                     color: Colors.white,
// // //                                     fontSize: 8,
// // //                                     fontWeight: FontWeight.bold),
// // //                               ),
// // //                             ],
// // //                             sectionsSpace: 2,
// // //                             centerSpaceRadius: 50,
// // //                             borderData: FlBorderData(show: false),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     )
// // //                   : const Center(
// // //                       child: Text(
// // //                         "No Data Available",
// // //                         style: TextStyle(
// // //                             fontSize: 16, fontWeight: FontWeight.w500),
// // //                       ),
// // //                     ),
// // //               const SizedBox(height: 8),
// // //             ],
// // //           ),
// // //           Positioned(
// // //             top: 2,
// // //             left: 0,
// // //             child: IconButton(
// // //               icon: const Icon(Icons.arrow_back_ios_new_outlined,
// // //                   size: 20, color: Colors.white),
// // //               onPressed: () {
// // //                 Navigator.of(context).pop();
// // //               },
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // class BalanceModel {
// // //   String month;
// // //   double maintenance;
// // //   double lastMonthBalance;
// // //   double electricityBill;
// // //   double otherBills;
// // //   double securitySal;
// // //   String id;

// // //   BalanceModel({
// // //     required this.month,
// // //     required this.maintenance,
// // //     required this.lastMonthBalance,
// // //     required this.electricityBill,
// // //     required this.otherBills,
// // //     required this.securitySal,
// // //     required this.id,
// // //   });
// // // }

// // // class WaveClipper extends CustomClipper<Path> {
// // //   @override
// // //   Path getClip(Size size) {
// // //     final path = Path();
// // //     path.lineTo(0, size.height - 50);
// // //     path.quadraticBezierTo(
// // //         size.width / 4, size.height, size.width / 2, size.height - 50);
// // //     path.quadraticBezierTo(
// // //         3 * size.width / 4, size.height - 100, size.width, size.height - 50);
// // //     path.lineTo(size.width, 0);
// // //     path.close();
// // //     return path;
// // //   }

// // //   @override
// // //   bool shouldReclip(CustomClipper<Path> oldClipper) {
// // //     return false;
// // //   }
// // // }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:fl_chart/fl_chart.dart';

// // class ReportGenerator extends StatefulWidget {
// //   @override
// //   State createState() => _ReportGenerator();
// // }

// // class _ReportGenerator extends State {
// //   Map<String, double> fieldTotals = {
// //     "maintenance": 0,
// //     "lastMonthBalance": 0,
// //     "electricityBill": 0,
// //     "otherBills": 0,
// //     "securitySal": 0,
// //   };

// //   int touchedIndex = -1;

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchBalanceSheet();
// //   }

// //   Future<void> fetchBalanceSheet() async {
// //     try {
// //       final querySnapshot =
// //           await FirebaseFirestore.instance.collection('balanceSheet').get();

// //       final fetchedBalances = querySnapshot.docs.map((doc) {
// //         final balanceData = doc.data() as Map<String, dynamic>;
// //         return BalanceModel(
// //           month: balanceData['month'] ?? 'No Month',
// //           maintenance: balanceData['maintenance'] ?? 0.0,
// //           lastMonthBalance: balanceData['lastMonthBalance'] ?? 0.0,
// //           electricityBill: balanceData['electricityBill'] ?? 0.0,
// //           otherBills: balanceData['otherBills'] ?? 0.0,
// //           securitySal: balanceData['securitySal'] ?? 0.0,
// //           id: doc.id,
// //         );
// //       }).toList();

// //       final totals = {
// //         "maintenance": 0.0,
// //         "lastMonthBalance": 0.0,
// //         "electricityBill": 0.0,
// //         "otherBills": 0.0,
// //         "securitySal": 0.0,
// //       };

// //       for (var item in fetchedBalances) {
// //         totals["maintenance"] = totals["maintenance"]! + item.maintenance;
// //         totals["lastMonthBalance"] =
// //             totals["lastMonthBalance"]! + item.lastMonthBalance;
// //         totals["electricityBill"] =
// //             totals["electricityBill"]! + item.electricityBill;
// //         totals["otherBills"] = totals["otherBills"]! + item.otherBills;
// //         totals["securitySal"] = totals["securitySal"]! + item.securitySal;
// //       }

// //       setState(() {
// //         fieldTotals = totals;
// //       });
// //     } catch (e) {
// //       print('Error fetching balances: $e');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           // Wave Background
// //           ClipPath(
// //             clipper: WaveClipper(),
// //             child: Container(
// //               height: 250,
// //               decoration: const BoxDecoration(
// //                 gradient: LinearGradient(
// //                   colors: [
// //                     Color.fromARGB(255, 104, 126, 192),
// //                     Color.fromARGB(255, 34, 72, 186)
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Column(
// //             children: [
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 40),
// //                 child: Text(
// //                   "Analytics Report",
// //                   style: GoogleFonts.quicksand(
// //                       color: Colors.white,
// //                       fontSize: 24,
// //                       fontWeight: FontWeight.bold),
// //                   textAlign: TextAlign.center,
// //                 ),
// //               ),
// //               const SizedBox(height: 80),
// //               fieldTotals.values.any((value) => value > 0)
// //                   ? Padding(
// //                       padding: const EdgeInsets.symmetric(horizontal: 20),
// //                       child: AspectRatio(
// //                         aspectRatio: 1.3,
// //                         child: PieChart(
// //                           PieChartData(
// //                             sections: fieldTotals.entries
// //                                 .toList()
// //                                 .asMap()
// //                                 .entries
// //                                 .map((entry) {
// //                               final index = entry.key; // The index of the entry
// //                               final field =
// //                                   entry.value; // The actual MapEntry object
// //                               final isTouched = index == touchedIndex;
// //                               final double fontSize = isTouched ? 18 : 14;
// //                               final double radius = isTouched ? 70 : 60;

// //                               return PieChartSectionData(
// //                                 value: field.value,
// //                                 color: _getColorForField(field.key),
// //                                 radius: radius,
// //                                 badgeWidget: _getIconForField(field.key),
// //                                 badgePositionPercentageOffset:
// //                                     1.2, // Position the icon
// //                                 title: '',
// //                                 titleStyle: TextStyle(
// //                                   fontSize: fontSize,
// //                                   fontWeight: FontWeight.bold,
// //                                 ),
// //                               );
// //                             }).toList(),
// //                             sectionsSpace: 2,
// //                             centerSpaceRadius: 50,
// //                             borderData: FlBorderData(show: false),
// //                           ),
// //                         ),
// //                       ),
// //                     )
// //                   : const Center(
// //                       child: Text(
// //                         "No Data Available",
// //                         style: TextStyle(
// //                             fontSize: 16, fontWeight: FontWeight.w500),
// //                       ),
// //                     ),
// //               const SizedBox(height: 8),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 20),
// //                 child: Column(
// //                   children: fieldTotals.entries.map((entry) {
// //                     return Row(
// //                       children: [
// //                         Container(
// //                           width: 16,
// //                           height: 16,
// //                           decoration: BoxDecoration(
// //                             color: _getColorForField(entry.key),
// //                             shape: BoxShape.circle,
// //                           ),
// //                         ),
// //                         const SizedBox(width: 8),
// //                         Text(
// //                           "${entry.key} (${entry.value.toStringAsFixed(2)})",
// //                           style: const TextStyle(
// //                               fontSize: 14, fontWeight: FontWeight.w500),
// //                         ),
// //                       ],
// //                     );
// //                   }).toList(),
// //                 ),
// //               ),
// //               const SizedBox(height: 8),
// //             ],
// //           ),
// //           Positioned(
// //             top: 2,
// //             left: 0,
// //             child: IconButton(
// //               icon: const Icon(Icons.arrow_back_ios_new_outlined,
// //                   size: 20, color: Colors.white),
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Color _getColorForField(String field) {
// //     switch (field) {
// //       case "maintenance":
// //         return Colors.blue;
// //       case "lastMonthBalance":
// //         return Colors.orange;
// //       case "electricityBill":
// //         return Colors.red;
// //       case "otherBills":
// //         return Colors.yellow;
// //       case "securitySal":
// //         return Colors.green;
// //       default:
// //         return Colors.grey;
// //     }
// //   }

// //   Widget _getIconForField(String field) {
// //     switch (field) {
// //       case "maintenance":
// //         return Icon(Icons.home, color: Colors.white, size: 20);
// //       case "lastMonthBalance":
// //         return Icon(Icons.account_balance, color: Colors.white, size: 20);
// //       case "electricityBill":
// //         return Icon(Icons.bolt, color: Colors.white, size: 20);
// //       case "otherBills":
// //         return Icon(Icons.receipt, color: Colors.white, size: 20);
// //       case "securitySal":
// //         return Icon(Icons.security, color: Colors.white, size: 20);
// //       default:
// //         return Icon(Icons.error, color: Colors.white, size: 20);
// //     }
// //   }
// // }

// // class BalanceModel {
// //   String month;
// //   double maintenance;
// //   double lastMonthBalance;
// //   double electricityBill;
// //   double otherBills;
// //   double securitySal;
// //   String id;

// //   BalanceModel({
// //     required this.month,
// //     required this.maintenance,
// //     required this.lastMonthBalance,
// //     required this.electricityBill,
// //     required this.otherBills,
// //     required this.securitySal,
// //     required this.id,
// //   });
// // }

// // class WaveClipper extends CustomClipper<Path> {
// //   @override
// //   Path getClip(Size size) {
// //     final path = Path();
// //     path.lineTo(0, size.height - 50);
// //     path.quadraticBezierTo(
// //         size.width / 4, size.height, size.width / 2, size.height - 50);
// //     path.quadraticBezierTo(
// //         3 * size.width / 4, size.height - 100, size.width, size.height - 50);
// //     path.lineTo(size.width, 0);
// //     path.close();
// //     return path;
// //   }

// //   @override
// //   bool shouldReclip(CustomClipper<Path> oldClipper) {
// //     return false;
// //   }
// // }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportGenerator extends StatefulWidget {
  @override
  State createState() => _ReportGeneratorState();
}

class _ReportGeneratorState extends State {
  List<BalanceModel> balance = [];
  Map<String, double> fieldTotals = {
    "maintenance": 0,
    "lastMonthBalance": 0,
    "electricityBill": 0,
    "otherBills": 0,
    "securitySal": 0,
  };

  int touchedIndex = -1;

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
          maintenance: balanceData['maintenance'] ?? 0.0,
          lastMonthBalance: balanceData['lastMonthBalance'] ?? 0.0,
          electricityBill: balanceData['electricityBill'] ?? 0.0,
          otherBills: balanceData['otherBills'] ?? 0.0,
          securitySal: balanceData['securitySal'] ?? 0.0,
          id: doc.id,
        );
      }).toList();

      // Calculate totals for each field
      final totals = {
        "maintenance": 0.0,
        "lastMonthBalance": 0.0,
        "electricityBill": 0.0,
        "otherBills": 0.0,
        "securitySal": 0.0,
      };

      for (var item in fetchedBalances) {
        totals["maintenance"] = totals["maintenance"]! + item.maintenance;
        totals["lastMonthBalance"] =
            totals["lastMonthBalance"]! + item.lastMonthBalance;
        totals["electricityBill"] =
            totals["electricityBill"]! + item.electricityBill;
        totals["otherBills"] = totals["otherBills"]! + item.otherBills;
        totals["securitySal"] = totals["securitySal"]! + item.securitySal;
      }

      setState(() {
        balance = fetchedBalances;
        fieldTotals = totals;
      });
    } catch (e) {
      print('Error fetching balances: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Wave Background
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  "Analytics Report",
                  style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 110),
              fieldTotals.values.any((value) => value > 0)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AspectRatio(
                        aspectRatio: 1.3,
                        child: PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback: (event, response) {
                                if (response != null &&
                                    response.touchedSection != null) {
                                  setState(() {
                                    touchedIndex = response
                                        .touchedSection!.touchedSectionIndex;
                                  });
                                } else {
                                  setState(() {
                                    touchedIndex = -1;
                                  });
                                }
                              },
                            ),
                            sections: _buildPieChartSections(),
                            sectionsSpace: 3,
                            centerSpaceRadius: 90,
                            borderData: FlBorderData(show: false),
                          ),
                        ),
                      ),
                    )
                  : const Center(
                      child: Text(
                        "No Data Available",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
              const SizedBox(height: 8),
              // Add Legend Below the Chart
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: fieldTotals.entries.map((entry) {
                    return Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: _getColorForField(entry.key),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${entry.key} (${entry.value.toStringAsFixed(2)})",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 8),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: balance.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       final item = balance[index];
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 20, vertical: 10),
              //         child: Card(
              //           elevation: 5,
              //           shadowColor: const Color.fromARGB(255, 9, 86, 124),
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10)),
              //           child: Padding(
              //             padding: const EdgeInsets.all(10.0),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text("Month: ${item.month}",
              //                     style: const TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 18)),
              //                 Text("Maintenance: ${item.maintenance}",
              //                     style: const TextStyle(fontSize: 14)),
              //                 Text(
              //                     "Last Month Balance: ${item.lastMonthBalance}",
              //                     style: const TextStyle(fontSize: 14)),
              //                 Text("Electricity Bill: ${item.electricityBill}",
              //                     style: const TextStyle(fontSize: 14)),
              //                 Text("Other Bills: ${item.otherBills}",
              //                     style: const TextStyle(fontSize: 14)),
              //                 Text("Security Salary: ${item.securitySal}",
              //                     style: const TextStyle(fontSize: 14)),
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // )
            ],
          ),
          Positioned(
            top: 2,
            left: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined,
                  size: 20, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    return fieldTotals.entries.toList().asMap().entries.map((entry) {
      final index = entry.key; // The index of the entry
      final field = entry.value; // The actual MapEntry object
      final isTouched = index == touchedIndex;
      final double fontSize = isTouched ? 18 : 14;
      final double radius = isTouched ? 70 : 60;
      return PieChartSectionData(
        value: field.value,
        color: _getColorForField(field.key),
        radius: radius,
        badgeWidget: _getIconForField(field.key),
        badgePositionPercentageOffset: 1.2, // Position the icon
        title: '',
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      );
    }).toList();
  }

  Widget _getIconForField(String field) {
    switch (field) {
      case "maintenance":
        return const Icon(Icons.home, color: Colors.blue, size: 18);
      case "lastMonthBalance":
        return const Icon(Icons.attach_money, color: Colors.orange, size: 18);
      case "electricityBill":
        return const Icon(Icons.lightbulb, color: Colors.red, size: 18);
      case "otherBills":
        return const Icon(Icons.receipt, color: Colors.yellow, size: 18);
      case "securitySal":
        return const Icon(Icons.security, color: Colors.green, size: 18);
      default:
        return const Icon(Icons.error, color: Colors.grey, size: 18);
    }
  }

  Color _getColorForField(String field) {
    switch (field) {
      case "maintenance":
        return Colors.blue;
      case "lastMonthBalance":
        return Colors.orange;
      case "electricityBill":
        return Colors.red;
      case "otherBills":
        return Colors.yellow;
      case "securitySal":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}

class BalanceModel {
  String month;
  double maintenance;
  double lastMonthBalance;
  double electricityBill;
  double otherBills;
  double securitySal;
  String id;

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
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 50);
    path.quadraticBezierTo(
        3 * size.width / 4, size.height - 100, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
