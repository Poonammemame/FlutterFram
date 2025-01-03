import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LostFoundPage extends StatefulWidget {
  @override
  _LostFoundPageState createState() => _LostFoundPageState();
}

class _LostFoundPageState extends State<LostFoundPage> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _addItemToFirestore() async {
    if (_itemNameController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      final currentTime = DateTime.now();

      await FirebaseFirestore.instance.collection('lost_found_items').add({
        'itemName': _itemNameController.text,
        'description': _descriptionController.text,
        'status': 'lost',
        'time': currentTime.toIso8601String(),
      });

      _itemNameController.clear();
      _descriptionController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Lost Item"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _itemNameController,
                      decoration: const InputDecoration(
                        labelText: "Item Name",
                      ),
                    ),
                    TextField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                          labelText: "Description",
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      _addItemToFirestore();
                      Navigator.pop(context);
                    },
                    child: Text("Add"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Color.fromARGB(255, 34, 72, 186),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 340,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 104, 126, 192),
                      Color.fromARGB(255, 34, 72, 186),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        alignment: Alignment.bottomLeft,
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 300),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lost & Found',
                        style: GoogleFonts.quicksand(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // StreamBuilder to fetch data from Firebase
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('lost_found_items')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return const Center(
                                child:
                                    Text('No lost and found items available.'));
                          }

                          var items = snapshot.data!.docs;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              var item = items[index];
                              return ListTile(
                                title: Text(
                                  item['itemName'] ?? 'Unnamed Item',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(item['description'] ??
                                    'No description available'),
                                trailing: IconButton(
                                  icon: const Icon(Icons.check_circle,
                                      color: Colors.green),
                                  onPressed: () {
                                    // Mark as found
                                    _markAsFound(item.id);
                                  },
                                ),
                              );
                            },
                          );
                        },
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

  // Function to mark an item as found
  Future<void> _markAsFound(String itemId) async {
    await FirebaseFirestore.instance
        .collection('lost_found_items')
        .doc(itemId)
        .update({'status': 'found'});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Item marked as found')),
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
