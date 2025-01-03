import "package:flutter/material.dart";

class Announce extends StatelessWidget {
  const Announce({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
          SingleChildScrollView(
            child: Column(
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
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome, Resident",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const TextField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.search, color: Colors.grey),
                            border: InputBorder.none,
                            hintText: "Search facilities...",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Facility Reservation",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      FacilityReservationCard(facilityName: "Gym"),
                      FacilityReservationCard(facilityName: "Pool"),
                      FacilityReservationCard(facilityName: "Party Hall"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Equipment Status",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      EquipmentStatusCard(
                          equipmentName: "Treadmill", isAvailable: true),
                      EquipmentStatusCard(
                          equipmentName: "Dumbbells", isAvailable: false),
                      EquipmentStatusCard(
                          equipmentName: "Rowing Machine", isAvailable: true),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Usage Logs & Occupancy",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      UsageLogCard(
                          facilityName: "Gym", occupancy: "5 / 10 Occupied"),
                      UsageLogCard(
                          facilityName: "Pool", occupancy: "2 / 8 Occupied"),
                      UsageLogCard(
                          facilityName: "Party Hall", occupancy: "Reserved"),
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

class FacilityReservationCard extends StatelessWidget {
  final String facilityName;

  FacilityReservationCard({required this.facilityName});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(facilityName),
        subtitle: const Text("Reserve your slot"),
        trailing: ElevatedButton(
          onPressed: () {
            _selectDateTime(context);
          },
          child: const Text("Reserve"),
        ),
      ),
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (time != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Reserved on $date at ${time.format(context)}")),
        );
      }
    }
  }
}

class EquipmentStatusCard extends StatelessWidget {
  final String equipmentName;
  final bool isAvailable;

  EquipmentStatusCard({required this.equipmentName, required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          Icons.fitness_center,
          color: isAvailable ? Colors.green : Colors.red,
        ),
        title: Text(equipmentName),
        subtitle: Text(isAvailable ? "Available" : "Under Maintenance"),
      ),
    );
  }
}

class UsageLogCard extends StatelessWidget {
  final String facilityName;
  final String occupancy;

  const UsageLogCard({required this.facilityName, required this.occupancy});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(facilityName),
        subtitle: Text("Current Occupancy: $occupancy"),
      ),
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
