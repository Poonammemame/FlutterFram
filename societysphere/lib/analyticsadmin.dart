// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:societysphere/balancemodel.dart';

// class Showbalancesheets extends StatefulWidget {
//   @override
//   State<Showbalancesheets> createState() => _ShowbalancesheetsState();
// }

// class _ShowbalancesheetsState extends State<Showbalancesheets> {
//   List<BalanceModel> balance = [];
//   Map<String, double> fieldTotals = {
//     "maintenance": 0,
//     "lastMonthBalance": 0,
//     "electricityBill": 0,
//     "otherBills": 0,
//     "securitySal": 0,
//   };

//   int touchedIndex = -1;

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration.zero, () async {
//       await fetchBalanceSheet();
//     });
//   }

//   Future<void> fetchBalanceSheet() async {
//     try {
//       final querySnapshot =
//           await FirebaseFirestore.instance.collection('balanceSheet').get();

//       final fetchedBalances = querySnapshot.docs.map((doc) {
//         final balanceData = doc.data() as Map<String, dynamic>;
//         log("Fetched data: ${balanceData['month']} (${balanceData['month'].runtimeType})");
//         return BalanceModel.fromFirestore(balanceData, doc.id);
//       }).toList();

//       final totals = {
//         "maintenance": 0.0,
//         "lastMonthBalance": 0.0,
//         "electricityBill": 0.0,
//         "otherBills": 0.0,
//         "securitySal": 0.0,
//       };

//       for (var item in fetchedBalances) {
//         totals["maintenance"] = totals["maintenance"]! + item.maintenance;
//         totals["lastMonthBalance"] =
//             totals["lastMonthBalance"]! + item.lastMonthBalance;
//         totals["electricityBill"] =
//             totals["electricityBill"]! + item.electricityBill;
//         totals["otherBills"] = totals["otherBills"]! + item.otherBills;
//         totals["securitySal"] = totals["securitySal"]! + item.securitySal;
//       }

//       setState(() {
//         balance = fetchedBalances;
//         fieldTotals = totals;
//       });
//     } catch (e) {
//       print('Error fetching balances: $e');
//     }
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
//                     Color.fromARGB(255, 34, 72, 186)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 40),
//                 child: Text(
//                   "Analytics Report",
//                   style: GoogleFonts.quicksand(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               const SizedBox(height: 110),
//               fieldTotals.values.any((value) => value > 0)
//                   ? Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: AspectRatio(
//                         aspectRatio: 1.3,
//                         child: PieChart(
//                           PieChartData(
//                             pieTouchData: PieTouchData(
//                               touchCallback: (event, response) {
//                                 if (response != null &&
//                                     response.touchedSection != null) {
//                                   setState(() {
//                                     touchedIndex = response
//                                         .touchedSection!.touchedSectionIndex;
//                                   });
//                                 } else {
//                                   setState(() {
//                                     touchedIndex = -1;
//                                   });
//                                 }
//                               },
//                             ),
//                             sections: _buildPieChartSections(),
//                             sectionsSpace: 3,
//                             centerSpaceRadius: 90,
//                             borderData: FlBorderData(show: false),
//                           ),
//                         ),
//                       ),
//                     )
//                   : const Center(
//                       child: Text(
//                         "No Data Available",
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w500),
//                       ),
//                     ),
//               const SizedBox(height: 8),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   children: fieldTotals.entries.map((entry) {
//                     return Row(
//                       children: [
//                         Container(
//                           width: 16,
//                           height: 16,
//                           decoration: BoxDecoration(
//                             color: _getColorForField(entry.key),
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Text(
//                           "${entry.key} (${entry.value.toStringAsFixed(2)})",
//                           style: const TextStyle(
//                               fontSize: 14, fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     );
//                   }).toList(),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: balance.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     final item = balance[index];
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 10),
//                       child: Card(
//                         elevation: 5,
//                         shadowColor: const Color.fromARGB(255, 9, 86, 124),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Month: ${item.month}",
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18)),
//                               Text("Maintenance: ${item.maintenance}",
//                                   style: const TextStyle(fontSize: 14)),
//                               Text(
//                                   "Last Month Balance: ${item.lastMonthBalance}",
//                                   style: const TextStyle(fontSize: 14)),
//                               Text("Electricity Bill: ${item.electricityBill}",
//                                   style: const TextStyle(fontSize: 14)),
//                               Text("Other Bills: ${item.otherBills}",
//                                   style: const TextStyle(fontSize: 14)),
//                               Text("Security Salary: ${item.securitySal}",
//                                   style: const TextStyle(fontSize: 14)),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//           Positioned(
//             top: 2,
//             left: 0,
//             child: IconButton(
//               icon: const Icon(Icons.arrow_back_ios_new_outlined,
//                   size: 20, color: Colors.white),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // List<PieChartSectionData> _buildPieChartSections() {
//   //   return [
//   //     PieChartSectionData(
//   //       value: fieldTotals['maintenance']!,
//   //       color: Colors.blue,
//   //       title: 'Maintenance\n${fieldTotals['maintenance']!.toStringAsFixed(2)}',
//   //       radius: touchedIndex == 0 ? 70 : 60,
//   //     ),
//   //     PieChartSectionData(
//   //       value: fieldTotals['lastMonthBalance']!,
//   //       color: Colors.green,
//   //       title:
//   //           'Last Month Balance\n${fieldTotals['lastMonthBalance']!.toStringAsFixed(2)}',
//   //       radius: touchedIndex == 1 ? 70 : 60,
//   //     ),
//   //     PieChartSectionData(
//   //       value: fieldTotals['electricityBill']!,
//   //       color: Colors.orange,
//   //       title:
//   //           'Electricity\n${fieldTotals['electricityBill']!.toStringAsFixed(2)}',
//   //       radius: touchedIndex == 2 ? 70 : 60,
//   //     ),
//   //     PieChartSectionData(
//   //       value: fieldTotals['otherBills']!,
//   //       color: Colors.red,
//   //       title: 'Other Bills\n${fieldTotals['otherBills']!.toStringAsFixed(2)}',
//   //       radius: touchedIndex == 3 ? 70 : 60,
//   //     ),
//   //     PieChartSectionData(
//   //       value: fieldTotals['securitySal']!,
//   //       color: Colors.purple,
//   //       title:
//   //           'Security Salary\n${fieldTotals['securitySal']!.toStringAsFixed(2)}',
//   //       radius: touchedIndex == 4 ? 70 : 60,
//   //     ),
//   //   ];
//   // }

// List<PieChartSectionData> _buildPieChartSections() {
//   return [
//     PieChartSectionData(
//       value: fieldTotals['maintenance']!,
//       color: Colors.blue,
//       radius: touchedIndex == 0 ? 70 : 60,
//       title: _buildPieChartTitle(Icons.account_balance_wallet, 'Maintenance', fieldTotals['maintenance']!),
//     ),
//     PieChartSectionData(
//       value: fieldTotals['lastMonthBalance']!,
//       color: Colors.green,
//       radius: touchedIndex == 1 ? 70 : 60,
//       title: _buildPieChartTitle(Icons.arrow_forward, 'Last Month Balance', fieldTotals['lastMonthBalance']!),
//     ),
//     PieChartSectionData(
//       value: fieldTotals['electricityBill']!,
//       color: Colors.orange,
//       radius: touchedIndex == 2 ? 70 : 60,
//       title: _buildPieChartTitle(Icons.bolt, 'Electricity Bill', fieldTotals['electricityBill']!),
//     ),
//     PieChartSectionData(
//       value: fieldTotals['otherBills']!,
//       color: Colors.red,
//       radius: touchedIndex == 3 ? 70 : 60,
//       title: _buildPieChartTitle(Icons.receipt, 'Other Bills', fieldTotals['otherBills']!),
//     ),
//     PieChartSectionData(
//       value: fieldTotals['securitySal']!,
//       color: Colors.purple,
//       radius: touchedIndex == 4 ? 70 : 60,
//       title: _buildPieChartTitle(Icons.security, 'Security Salary', fieldTotals['securitySal']!),
//     ),
//   ];
// }

// // Helper method to build the title with an icon and number
// Widget _buildPieChartTitle(IconData icon, String label, double value) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Icon(icon, size: 18, color: Colors.white),
//       const SizedBox(width: 5),
//       Text(
//         '${value.toStringAsFixed(2)}',
//         style: const TextStyle(fontSize: 14, color: Colors.white),
//       ),
//     ],
//   );
// }

//   Color _getColorForField(String field) {
//     switch (field) {
//       case 'maintenance':
//         return Colors.blue;
//       case 'lastMonthBalance':
//         return Colors.green;
//       case 'electricityBill':
//         return Colors.orange;
//       case 'otherBills':
//         return Colors.red;
//       case 'securitySal':
//         return Colors.purple;
//       default:
//         return Colors.black;
//     }
//   }
// }

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, size.height - 50);
//     path.quadraticBezierTo(
//         size.width / 4, size.height, size.width / 2, size.height - 50);
//     path.quadraticBezierTo(
//         3 * size.width / 4, size.height - 100, size.width, size.height - 50);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:societysphere/balancemodel.dart';

class Showbalancesheets extends StatefulWidget {
  @override
  State<Showbalancesheets> createState() => _ShowbalancesheetsState();
}

class _ShowbalancesheetsState extends State<Showbalancesheets> {
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
    Future.delayed(Duration.zero, () async {
      await fetchBalanceSheet();
    });
  }

  Future<void> fetchBalanceSheet() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('balanceSheet').get();

      final fetchedBalances = querySnapshot.docs.map((doc) {
        final balanceData = doc.data() as Map<String, dynamic>;
        log("Fetched data: ${balanceData['month']} (${balanceData['month'].runtimeType})");
        return BalanceModel.fromFirestore(balanceData, doc.id);
      }).toList();

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
                            centerSpaceRadius: 70,
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
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Column(
              //     children: fieldTotals.entries.map((entry) {
              //       return Row(
              //         children: [
              //           Container(
              //             width: 16,
              //             height: 16,
              //             decoration: BoxDecoration(
              //               color: _getColorForField(entry.key),
              //               shape: BoxShape.circle,
              //             ),
              //           ),
              //           const SizedBox(width: 8),
              //           Text(
              //             "${entry.key} (${entry.value.toStringAsFixed(2)})",
              //             style: const TextStyle(
              //                 fontSize: 14, fontWeight: FontWeight.w500),
              //           ),
              //         ],
              //       );
              //     }).toList(),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: fieldTotals.entries.map((entry) {
                    return Row(
                      children: [
                        Icon(
                          _getIconForField(
                              entry.key), // Get the icon for the field
                          size: 20, // Set icon size
                          color: _getColorForField(
                              entry.key), // Optionally, use the same color
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${entry.key} (${entry.value.toStringAsFixed(2)})", // Display field name and value
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: balance.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = balance[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Card(
                        elevation: 5,
                        shadowColor: const Color.fromARGB(255, 9, 86, 124),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Month: ${item.month}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              Text("Maintenance: ${item.maintenance}",
                                  style: const TextStyle(fontSize: 14)),
                              Text(
                                  "Last Month Balance: ${item.lastMonthBalance}",
                                  style: const TextStyle(fontSize: 14)),
                              Text("Electricity Bill: ${item.electricityBill}",
                                  style: const TextStyle(fontSize: 14)),
                              Text("Other Bills: ${item.otherBills}",
                                  style: const TextStyle(fontSize: 14)),
                              Text("Security Salary: ${item.securitySal}",
                                  style: const TextStyle(fontSize: 14)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
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

  // List<PieChartSectionData> _buildPieChartSections() {
  //   return [
  //     PieChartSectionData(
  //       value: fieldTotals['maintenance']!,
  //       color: Colors.blue,
  //       radius: touchedIndex == 0 ? 70 : 50,
  //       // title: '${fieldTotals['maintenance']!.toStringAsFixed(2)}',
  //       badgeWidget: Padding(
  //         padding: const EdgeInsets.only(bottom: 50.0),
  //         child:
  //             Icon(Icons.account_balance_wallet, color: Colors.white, size: 20),
  //       ),
  //     ),
  //     PieChartSectionData(
  //       value: fieldTotals['lastMonthBalance']!,
  //       color: Colors.green,
  //       radius: touchedIndex == 1 ? 70 : 50,
  //       title: '${fieldTotals['lastMonthBalance']!.toStringAsFixed(2)}',
  //       badgeWidget: Padding(
  //         padding: const EdgeInsets.only(bottom: 20.0),
  //         child: Icon(Icons.account_balance, color: Colors.white, size: 20),
  //       ),
  //     ),
  //     PieChartSectionData(
  //       value: fieldTotals['electricityBill']!,
  //       color: Colors.orange,
  //       radius: touchedIndex == 2 ? 70 : 50,
  //       title: '${fieldTotals['electricityBill']!.toStringAsFixed(2)}',
  //     ),
  //     PieChartSectionData(
  //       value: fieldTotals['otherBills']!,
  //       color: Colors.red,
  //       radius: touchedIndex == 3 ? 70 : 50,
  //       title: '${fieldTotals['otherBills']!.toStringAsFixed(2)}',
  //     ),
  //     PieChartSectionData(
  //       value: fieldTotals['securitySal']!,
  //       color: Colors.purple,
  //       radius: touchedIndex == 4 ? 70 : 50,
  //       title: '${fieldTotals['securitySal']!.toStringAsFixed(2)}',
  //     ),
  //   ];
  // }

  List<PieChartSectionData> _buildPieChartSections() {
    // Calculate the total sum of all the fields
    double total = fieldTotals.values.reduce((a, b) => a + b);

    return [
      PieChartSectionData(
        value: fieldTotals['maintenance']!,
        color: Colors.blue,
        radius: touchedIndex == 0 ? 70 : 50,
        title: '',
        badgeWidget: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon(Icons.account_balance_wallet, color: Colors.white, size: 20),
              Text(
                '${(fieldTotals['maintenance']! / total * 100).toStringAsFixed(1)}%',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
      PieChartSectionData(
        value: fieldTotals['lastMonthBalance']!,
        color: Colors.green,
        radius: touchedIndex == 1 ? 70 : 50,
        title: '',
        badgeWidget: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon(Icons.account_balance, color: Colors.white, size: 20),
              Text(
                '${(fieldTotals['lastMonthBalance']! / total * 100).toStringAsFixed(1)}%',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
      PieChartSectionData(
        value: fieldTotals['electricityBill']!,
        color: Colors.orange,
        radius: touchedIndex == 2 ? 70 : 50,
        title: '',
        badgeWidget: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon(Icons.lightbulb, color: Colors.white, size: 20),
              Text(
                '${(fieldTotals['electricityBill']! / total * 100).toStringAsFixed(1)}%',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
      PieChartSectionData(
        value: fieldTotals['otherBills']!,
        color: Colors.red,
        radius: touchedIndex == 3 ? 70 : 50,
        title: '',
        badgeWidget: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon(Icons.receipt, color: Colors.white, size: 20),
              Text(
                '${(fieldTotals['otherBills']! / total * 100).toStringAsFixed(1)}%',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
      PieChartSectionData(
        value: fieldTotals['securitySal']!,
        color: Colors.purple,
        radius: touchedIndex == 4 ? 70 : 50,
        title: '',
        badgeWidget: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon(Icons.security, color: Colors.white, size: 20),
              Text(
                '${(fieldTotals['securitySal']! / total * 100).toStringAsFixed(1)}%',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  IconData _getIconForField(String field) {
    switch (field) {
      case 'maintenance':
        return Icons.account_balance_wallet;
      case 'lastMonthBalance':
        return Icons.account_balance;
      case 'electricityBill':
        return Icons.lightbulb;
      case 'otherBills':
        return Icons.receipt;
      case 'securitySal':
        return Icons.security;
      default:
        return Icons.help;
    }
  }

  Color _getColorForField(String field) {
    switch (field) {
      case 'maintenance':
        return Colors.blue;
      case 'lastMonthBalance':
        return Colors.green;
      case 'electricityBill':
        return Colors.orange;
      case 'otherBills':
        return Colors.red;
      case 'securitySal':
        return Colors.purple;
      default:
        return Colors.black;
    }
  }
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
