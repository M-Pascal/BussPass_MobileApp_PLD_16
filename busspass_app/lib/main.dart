import 'package:busspass_app/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'pages/booking.dart';
import 'pages/login_page.dart';
import 'pages/tickets_screen.dart';
import 'pages/profile_screen.dart';
import 'package:flutter/foundation.dart';
//firebase imports
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA9mI47tI-7gYJOhgnNDADqkQ7ZV35QUiY",
            authDomain: "buss-pass-6bda1.firebaseapp.com",
            projectId: "buss-pass-6bda1",
            storageBucket: "buss-pass-6bda1.firebasestorage.app",
            messagingSenderId: "617500355829",
            appId: "1:617500355829:web:df10e7c1c616b9e20669bc"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Define the pages for each BottomNavigationBar item
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    Booking(),
    TicketHistoryScreen(),
    ProfilePage(), // Navigate to LoginPage when Profile is tapped
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue[900], // Dark blue background
        selectedItemColor: Colors.white, // White color for selected item
        unselectedItemColor:
            Colors.grey[300], // Light grey for unselected items
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
