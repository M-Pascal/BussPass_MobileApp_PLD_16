import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;

  const NavBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/booking');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/ticket-history');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Book',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt),
          label: 'Tickets',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}