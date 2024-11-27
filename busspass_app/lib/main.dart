import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import for Firebase initialization
import 'firebase_options.dart'; // Import the generated Firebase options
import 'package:firebase_auth/firebase_auth.dart';
import 'pages/home_screen.dart';
import 'pages/booking.dart';
import 'pages/login_page.dart';
import 'pages/tickets_screen.dart';
import 'pages/profile_screen.dart';
import 'pages/travel_screen.dart'; // Import the new TravelScreen

void main() async {
  // Ensure widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with DefaultFirebaseOptions
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Check if the user is already logged in via Firebase
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
      // User is already signed in, navigate to MainScreen
      runApp(MyApp(home: const MainScreen()));
    } else {
      // User is not signed in, navigate to LoginPage
      runApp(MyApp(home: const LoginPage()));
    }
  });
}

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BussPass App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: home,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Define the pages for each BottomNavigationBar item
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    Booking(),
    TravelScreen(), // Added TravelScreen as a new page
    TicketHistoryScreen(),
    ProfilePage(),
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
            icon: Icon(Icons.event_note), // Travel icon
            label: 'Booking',
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
