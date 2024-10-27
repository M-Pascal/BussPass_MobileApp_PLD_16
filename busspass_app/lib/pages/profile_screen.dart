import 'package:busspass_app/pages/menu_screen.dart';
import 'package:flutter/material.dart';

// void main() => runApp(ProfileApp());
//
// class ProfileApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Profile Page',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ProfilePage(),
//     );
//   }
// }
//
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String fullName = "";
  String username = "Enter username";
  String email = "";
  String contact = "";
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(390, 99),
        child: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 29, // Font size set to 29px
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Manage your profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> const BusspassHome())
                );
                // Open a menu or handle other functionality
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 27),

              // Profile Picture Section
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Username Displayed Dynamically
                    GestureDetector(
                      onTap: () {
                        _editDialog(
                            context, 'Username', username, 'Enter username',
                                (newValue) {
                              setState(() {
                                username = newValue;
                              });
                            });
                      },
                      child: Text(
                        username,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: username.isEmpty ? Colors.grey : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Edit Profile Picture Section
                    Container(
                      width: 139,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Handle profile picture edit
                        },
                        child: const Text(
                          'Edit Profile Picture',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Personal Information Section
              const Text(
                'Personal Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildEditableInfoRow('Full Name', fullName, 'Enter full name',
                      (newValue) {
                    setState(() {
                      fullName = newValue;
                    });
                  }),
              _buildEditableInfoRow('Email', email, 'Enter email', (newValue) {
                setState(() {
                  email = newValue;
                });
              }),
              _buildEditableInfoRow('Contact', contact, 'Enter contact',
                      (newValue) {
                    setState(() {
                      contact = newValue;
                    });
                  }),
              const SizedBox(height: 30),

              // Settings Section
              const Text(
                'Settings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Manage Notifications Toggle
              _buildSettingsRow(
                'Manage Notifications',
                Icons.notifications,
                Switch(
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                  activeColor: Colors.black,
                ),
              ),
              const SizedBox(height: 10),

              // Give Feedback
              _buildSettingsRow(
                'Give us feedback',
                Icons.edit,
                null,
              ),
              const SizedBox(height: 10),

              // Invite People
              _buildSettingsRow(
                'Invite People',
                Icons.people,
                null,
              ),
              const SizedBox(height: 10),

              // Rate Us
              _buildSettingsRow(
                'Rate us',
                Icons.star,
                null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build editable info row with text fields and placeholder
  Widget _buildEditableInfoRow(String label, String value, String placeholder,
      Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    _editDialog(context, label, value, placeholder, onChanged);
                  },
                  child: Text(
                    value.isEmpty ? placeholder : value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: value.isEmpty ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black), // Black pencil icon
            onPressed: () {
              _editDialog(context, label, value, placeholder, onChanged);
            },
          ),
        ],
      ),
    );
  }

  // Function to show dialog and edit the text value
  void _editDialog(BuildContext context, String label, String value,
      String placeholder, Function(String) onChanged) {
    TextEditingController controller = TextEditingController(text: value);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $label'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: placeholder),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                onChanged(controller.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Widget to build settings row with icons and optional trailing widget
  Widget _buildSettingsRow(String label, IconData icon, Widget? trailing) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(label),
      trailing: trailing,
      onTap: () {
        // Handle setting action
      },
    );
  }
}
