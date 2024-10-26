// import 'package:flutter/material.dart';
// import '../screens/auth/login_screen.dart';
// import '../screens/auth/signup_screen.dart';
// import '../screens/home_screen.dart';
// import '../screens/booking/booking_screen.dart';
// import '../screens/tickets/ticket_history_screen.dart';
// import '../screens/profile/profile_screen.dart';
//
// class AppRoutes {
//   static const String home = '/';
//   static const String login = '/login';
//   static const String signup = '/signup';
//   static const String booking = '/booking';
//   static const String ticketHistory = '/ticket-history';
//   static const String profile = '/profile';
//
//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case home:
//         return MaterialPageRoute(builder: (_) => const HomeScreen());
//       case login:
//         return MaterialPageRoute(builder: (_) => const LoginScreen());
//       case signup:
//         return MaterialPageRoute(builder: (_) => const SignupScreen());
//       case booking:
//         return MaterialPageRoute(builder: (_) => const BookingScreen());
//       case ticketHistory:
//         return MaterialPageRoute(builder: (_) => const TicketHistoryScreen());
//       case profile:
//         return MaterialPageRoute(builder: (_) => const ProfileScreen());
//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(
//               child: Text('No route defined for ${settings.name}'),
//             ),
//           ),
//         );
//     }
//   }
// }