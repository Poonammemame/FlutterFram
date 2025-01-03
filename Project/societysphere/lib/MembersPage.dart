import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:societysphere/aanouncement.dart';

class MembersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top Gradient Wave
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 104, 126, 192),
                    Color.fromARGB(255, 34, 72, 186),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button and Title
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Members",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                // // Search Bar
                // Container(
                //   height: 45,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30.0),
                //     color: Colors.white.withOpacity(0.3),
                //   ),
                //   child: const Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 10.0),
                //     child: Row(
                //       children: [
                //         Icon(Icons.search, color: Colors.white),
                //         SizedBox(width: 10),
                //         Text(
                //           "Search Members",
                //           style: TextStyle(color: Colors.white, fontSize: 16),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(height: 30),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        // TabBar
                        TabBar(
                          indicator: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.blue, Colors.lightBlueAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          labelStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          unselectedLabelColor: Colors.white,
                          tabs: const [
                            Tab(
                                text: "Admins",
                                icon: Icon(Icons.admin_panel_settings)),
                            Tab(text: "Users", icon: Icon(Icons.people)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // TabBar Views
                        const Expanded(
                          child: TabBarView(
                            children: [
                              MemberList(collection: "Admin", isAdmin: true),
                              MemberList(collection: "Users", isAdmin: false),
                            ],
                          ),
                        ),
                      ],
                    ),
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

class MemberList extends StatelessWidget {
  final String collection;
  final bool isAdmin;

  const MemberList({required this.collection, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(collection).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.blue));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              "No ${isAdmin ? 'Admins' : 'Users'} Found",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        }

        final members = snapshot.data!.docs;

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: members.length,
          itemBuilder: (context, index) {
            final member = members[index].data() as Map<String, dynamic>;

            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isAdmin
                        ? [Colors.blue.shade100, Colors.blue.shade50]
                        : [Colors.green.shade100, Colors.green.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        isAdmin ? Colors.blue.shade300 : Colors.green.shade300,
                    child: Icon(
                      isAdmin ? Icons.admin_panel_settings : Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    member['name'] ?? 'Unknown',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    isAdmin
                        ? 'Flat No: ${member['flatNo']} \nRole: ${member['role']}'
                        : 'Flat No: ${member['flatNo']} \nMobile: ${member['mobileNo']}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  isThreeLine: true,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
