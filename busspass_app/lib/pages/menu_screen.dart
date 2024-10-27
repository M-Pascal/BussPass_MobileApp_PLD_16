import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(BusspassApp());
// }
//
// // ignore: use_key_in_widget_constructors
// class BusspassApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false, // Removes the debug banner
//       home: BusspassHome(),
//       routes: {
//         '/profile': (context) => const ProfileScreen(),
//       },
//     );
//   }
// }

// ignore: use_key_in_widget_constructors
class BusspassHome extends StatelessWidget {
  const BusspassHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Stack(
        children: [
          Column(
            children: [
              // Top half with blue background and avatar
              Container(
                color: Colors.blue[900], // Dark blue color for top half background
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 80), // Adjusted spacing to move the content down
                    // Smaller square Avatar with thinner outline
                    Container(
                      width: 60, // Reduced size
                      height: 60, // Reduced size
                      decoration: BoxDecoration(
                        color: Colors.transparent, // No background color
                        border: Border.all(
                          color: Colors.white, // White square outline
                          width: 2, // Reduced border width
                        ),
                        borderRadius: BorderRadius.circular(8), // Square with slightly rounded corners
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8), // Ensures the image respects the corners
                        child: Image.network(
                          'https://your-new-avatar-url.com/avatar.png', // Change to your new avatar image URL
                          fit: BoxFit.cover, // Ensures the image covers the entire area
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback in case of image load failure
                            return const Icon(
                              Icons.account_circle,
                              size: 60, // Icon size
                              color: Colors.white,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text to match the blue background
                      ),
                    ),
                    const Text(
                      'Username: John1ODoe',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70, // White text for username
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom half for the menu
              Expanded(
                child: Container(
                  color: Colors.grey[200], // Bottom background color
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: const Center(
                            child: Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onTap: () {
                            // Navigate to Home screen
                          },
                        ),
                        const Divider(),
                        ListTile(
                          title: const Center(
                            child: Text(
                              'Explore',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onTap: () {
                            // Navigate to Explore screen
                          },
                        ),
                        const Divider(),
                        ListTile(
                          title: const Center(
                            child: Text(
                              'Tickets',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onTap: () {
                            // Navigate to Tickets screen
                          },
                        ),
                        const Divider(),
                        ListTile(
                          title: const Center(
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onTap: () {
                            // Navigate to Profile screen
                            Navigator.pushNamed(context, '/profile');
                          },
                        ),
                        const Divider(),

                        // Adjusted Logout Button position upwards but not too close to Profile
                        const SizedBox(height: 20), // Space between Profile and Log out
                        SizedBox(
                          width: 316, // Width based on your design
                          height: 45, // Height based on your design
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900], // Dark blue button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {
                              // Add your logout logic here
                            },
                            child:TextButton(
                              onPressed: () {
                                // Your onPressed function logic here
                                print("Logout button pressed");
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero, // Remove default padding if needed
                              ),
                              child: TextButton(
                                onPressed: () {
                                 Navigator.pop(context) ;
                                 Navigator.pop(context);
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero, // Remove default padding if needed
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: Colors.white, // White logout icon
                                    ),
                                    SizedBox(width: 8), // Space between icon and text
                                    Text(
                                      'Log out',
                                      style: TextStyle(
                                        color: Colors.white, // White text color
                                      ),
                                    ),
                                  ],
                                ),
                              )

                            )

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Title at the top left
          const Positioned(
            top: 10, // Adjusted position from the top
            left: 19, // Position from the left
            child: Text(
              'BussPass',
              style: TextStyle(
                fontSize: 36,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                height: 1.21, // Line height multiplier
                color: Colors.white, // Title color set to white
              ),
            ),
          ),

          // Subtitle positioned closer to the title
          const Positioned(
            top: 60, // Reduced position to move closer to the title
            left: 19,
            child: Text(
              'Travel when it’s convenient for you...', // Actual subtitle text
              style: TextStyle(
                fontSize: 11,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                height: 1, // Line height multiplier
                color: Colors.white, // Subtitle color set to white
              ),
            ),
          ),

          // Close button at the top right with close icon
          Positioned(
            top: 10, // Position from the top
            right: 19, // Position from the right
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[900], // Optional: background color for better visibility
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30, // Increased size for the close icon
                ),
                onPressed: () {
                  // Close action
                  Navigator.of(context).pop(); // Example close action
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Profile screen with Delete Account functionality
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Delete Account Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Blue button color
              ),
              onPressed: () {
                // Show confirmation dialog before deleting account
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Delete Account'),
                      content: const Text(
                          'Are you sure you want to delete your account? This action cannot be undone.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Perform account deletion logic here
                            Navigator.of(context).pop(); // Close dialog
                            Navigator.of(context).pop(); // Return to home
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Delete Account'),
            ),
          ],
        ),
      ),
    );
  }
}