
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:societysphere/MembersPage.dart';
import 'package:societysphere/aanouncement.dart';
import 'package:societysphere/profilePage.dart';
import 'package:societysphere/userDashboard.dart';
import 'package:societysphere/userEditProfile.dart';

class CurvedNavBar extends StatefulWidget {
  final String userId;
  final String username;
  final String flatNo;

  const CurvedNavBar({
    required this.userId,
    required this.username,
    required this.flatNo,
  });

  @override
  State<CurvedNavBar> createState() => _CurvedNavBarState();
}
class _CurvedNavBarState extends State<CurvedNavBar> {
  int currentIndex = 0;
  int unreadNotificationCount = 5;

  @override
  Widget build(BuildContext context) {
    // Initialize the screens list here
    final List<Widget> screens = [
      DashbordPageUser(userName: widget.username),
      MembersPage(),
      NotificationPage(notices: []),
      ProfilePage(userId: widget.userId), // Now widget.userId is accessible here
    ];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            //color: containerColors[currentIndex],
            child: screens[currentIndex],
          ),
          Positioned(  
            bottom: 1,   
            left: 0,
            right: 0,
            child: CurvedNavigationBar(
              items: <Widget>[
                const Icon(Icons.dashboard, size: 30, color: Colors.white),
                const Icon(Icons.search, size: 30, color: Colors.white),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.notifications, size: 30, color: Colors.white),
                    if (unreadNotificationCount > 0)
                      Positioned(
                        top: -5,
                        right: -5,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '$unreadNotificationCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const Icon(Icons.person, size: 30, color: Colors.white),
              ],
              color: Colors.blue,
              buttonBackgroundColor: Colors.blueGrey,
              backgroundColor: Colors.transparent,
              height: 50, // Adjust height here
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 500),
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                  if (index == 2) {
                    // Reset unread notifications if user views the notifications
                    unreadNotificationCount = 0;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
