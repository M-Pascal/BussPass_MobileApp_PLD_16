import 'package:busspass_app/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _rememberPassword = false;
  bool _obscurePassword = true;
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isRegisterSelected = false; // To toggle between Login and Register

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60), // Top space
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/bus_image.png', height: 100),
                    const SizedBox(height: 20),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10), // Space between title and terms
                    const Text(
                      'By signing in you are agreeing our',
                      style: TextStyle(fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to terms page
                      },
                      child: const Text(
                        'Term and privacy policy',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 20), // Space before login/register tabs
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isRegisterSelected = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: _isRegisterSelected
                                      ? Colors.blue
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (_isRegisterSelected)
                                Container(
                                  height: 2,
                                  width: 50,
                                  color: Colors.blue,
                                  margin: const EdgeInsets.only(top: 5),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            width: 20), // Space between Login and Register
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isRegisterSelected = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: !_isRegisterSelected
                                      ? Colors.blue
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (!_isRegisterSelected)
                                Container(
                                  height: 2,
                                  width: 50,
                                  color: Colors.blue,
                                  margin: const EdgeInsets.only(top: 5),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Space between form and tabs
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _firstNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  hintText: 'Enter your First Name',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter First Name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _lastNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  hintText: 'Enter your Last Name',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Last Name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _usernameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  prefixIcon: Icon(Icons.verified_user),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30), // Space between form and tabs
              TextFormField(
                controller: _contactController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Contact (+250)',
                  hintText: 'Enter your contact',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact';
                  }
                  if (!RegExp(r'^(?:\+250|0)7[0-9]{8}$').hasMatch(value)) {
                    return 'Please enter a valid contact';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      try {
                        CollectionReference collRef =
                            FirebaseFirestore.instance.collection('users');

                        // Add user to Firestore
                        await collRef.add({
                          'contact': _contactController.text,
                          'email': _emailController.text,
                          'first_name': _firstNameController.text,
                          'last_name': _lastNameController.text,
                          'password': _passwordController
                              .text, // Ideally hash this before storing
                          'username': _usernameController.text,
                        });

                        // Navigate to the main screen after successful registration
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()),
                        );
                      } catch (e) {
                        // Handle Firestore errors
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error registering user: $e')),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900], // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    const Text('or'),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Alredy have an account?"),
                        TextButton(
                          onPressed: () {
                            // Add sign up logic here
                          },
                          child: const Text('Log in'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
