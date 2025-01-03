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

  // Method to create a BalanceModel from Firestore data (with type handling)
  factory BalanceModel.fromFirestore(Map<String, dynamic> data, String docId) {
    return BalanceModel(
      month: data['month'] ?? 'No Month',
      maintenance: (data['maintenance'] is int
              ? (data['maintenance'] as int).toDouble()
              : data['maintenance']) ??
          0.0,
      lastMonthBalance: (data['lastMonthBalance'] is int
              ? (data['lastMonthBalance'] as int).toDouble()
              : data['lastMonthBalance']) ??
          0.0,
      electricityBill: (data['electricityBill'] is int
              ? (data['electricityBill'] as int).toDouble()
              : data['electricityBill']) ??
          0.0,
      otherBills: (data['otherBills'] is int
              ? (data['otherBills'] as int).toDouble()
              : data['otherBills']) ??
          0.0,
      securitySal: (data['securitySal'] is int
              ? (data['securitySal'] as int).toDouble()
              : data['securitySal']) ??
          0.0,
      id: docId,
    );
  }
}
