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
        options: FirebaseOptions(
            apiKey: "AIzaSyC20fzUzXAMkeb4JN7h_7quL9dmri4f100",
            authDomain: "busspass-aa1f9.firebaseapp.com",
            projectId: "busspass-aa1f9",
            storageBucket: "busspass-aa1f9.firebasestorage.app",
            messagingSenderId: "893472098723",
            appId: "1:893472098723:web:6490e78d2cfa51cb9a7216"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
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
