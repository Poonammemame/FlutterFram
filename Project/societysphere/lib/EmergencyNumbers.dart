import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyNumbersPage extends StatefulWidget {
  const EmergencyNumbersPage({Key? key}) : super(key: key);

  @override
  State<EmergencyNumbersPage> createState() => _EmergencyNumbersPageState();
}

class _EmergencyNumbersPageState extends State<EmergencyNumbersPage> {
  List<EmergencyContact> emergencyContacts = [
    const EmergencyContact(
      title: "Fire Brigade",
      number: "101",
      icon: Icons.local_fire_department,
      gradientColors: [Colors.red, Colors.orange],
    ),
    const EmergencyContact(
      title: "Police",
      number: "100",
      icon: Icons.security,
      gradientColors: [Colors.blue, Colors.blueAccent],
    ),
    const EmergencyContact(
      title: "Nearby Hospitals",
      number: "",
      icon: Icons.local_hospital,
      isMultiple: true,
      gradientColors: [Colors.green, Colors.teal],
      details: [
        HospitalDetails(
            name: "Narhe Multispeciality Hospital", number: "0201234567"),
        HospitalDetails(name: "Sai Shraddha Hospital", number: "0202345678"),
        HospitalDetails(name: "Spandan Hospital", number: "0203456789"),
      ],
    ),
  ];

  bool isAddingContact = false;
  bool isEditingContact = false;
  int? selectedIndex;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  void _makePhoneCall(String number) async {
    final Uri launchUri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $number';
    }
  }

  void _showHospitalDialog(
      BuildContext context, List<HospitalDetails> hospitals) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Nearby Hospitals",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: hospitals
              .map((hospital) => ListTile(
                    leading:
                        const Icon(Icons.local_hospital, color: Colors.blue),
                    title: Text(hospital.name),
                    subtitle: Text("Call: ${hospital.number}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.call, color: Colors.green),
                      onPressed: () => _makePhoneCall(hospital.number),
                    ),
                  ))
              .toList(),
        ),
        actions: [
          TextButton(
            child: const Text("Close", style: TextStyle(color: Colors.red)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _addNewContact() {
    setState(() {
      isAddingContact = !isAddingContact;
      if (isAddingContact) {
        _titleController.clear();
        _numberController.clear();
      }
    });
  }

  void _submitNewContact() {
    if (_titleController.text.isNotEmpty && _numberController.text.isNotEmpty) {
      final newContact = EmergencyContact(
        title: _titleController.text,
        number: _numberController.text,
        icon: Icons.phone,
        gradientColors: [Colors.purple, Colors.deepPurple],
      );
      setState(() {
        emergencyContacts.add(newContact);
        isAddingContact = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in both fields")),
      );
    }
  }

  void _editContact(int index) {
    setState(() {
      isEditingContact = true;
      selectedIndex = index;
      _titleController.text = emergencyContacts[index].title;
      _numberController.text = emergencyContacts[index].number;
    });
  }

  void _submitEditedContact() {
    if (_titleController.text.isNotEmpty && _numberController.text.isNotEmpty) {
      setState(() {
        emergencyContacts[selectedIndex!] = EmergencyContact(
          title: _titleController.text,
          number: _numberController.text,
          icon: Icons.phone,
          gradientColors: [Colors.purple, Colors.deepPurple],
        );
        isEditingContact = false;
        selectedIndex = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in both fields")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                child: Center(
                  child: Text(
                    "Emergency Contacts",
                    style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            if (isAddingContact || isEditingContact)
              Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: "Title"),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _numberController,
                    decoration:
                        const InputDecoration(labelText: "Phone Number"),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isEditingContact
                        ? _submitEditedContact
                        : _submitNewContact,
                    child: Text(
                        isEditingContact ? "Update Contact" : "Add Contact"),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            Expanded(
              child: ListView.builder(
                itemCount: emergencyContacts.length,
                itemBuilder: (context, index) {
                  final contact = emergencyContacts[index];
                  return GestureDetector(
                    onTap: contact.isMultiple
                        ? () =>
                            _showHospitalDialog(context, contact.details ?? [])
                        : () => _makePhoneCall(contact.number),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        gradient:
                            LinearGradient(colors: contact.gradientColors),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color:
                                contact.gradientColors.first.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(4, 4),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Icon(contact.icon,
                                size: 30, color: contact.gradientColors.first),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contact.title,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  contact.isMultiple
                                      ? "Tap to see nearby hospitals"
                                      : "Call: ${contact.number}",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                          if (!contact.isMultiple)
                            const Icon(Icons.call, color: Colors.white),
                          if (contact.isMultiple)
                            const Icon(Icons.arrow_forward,
                                color: Colors.white),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewContact,
        backgroundColor: const Color(0xFF1976D2),
        child: isAddingContact || isEditingContact
            ? const Icon(Icons.cancel)
            : const Icon(Icons.add),
      ),
    );
  }
}

class EmergencyContact {
  final String title;
  final String number;
  final IconData icon;
  final bool isMultiple;
  final List<HospitalDetails>? details;
  final List<Color> gradientColors;

  const EmergencyContact({
    required this.title,
    required this.number,
    required this.icon,
    required this.gradientColors,
    this.isMultiple = false,
    this.details,
  });
}

class HospitalDetails {
  final String name;
  final String number;

  const HospitalDetails({
    required this.name,
    required this.number,
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
