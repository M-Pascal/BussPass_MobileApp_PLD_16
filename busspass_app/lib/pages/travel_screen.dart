import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class TravelScreen extends StatefulWidget {
  const TravelScreen({super.key});

  @override
  _TravelScreenState createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseService _firebaseService = FirebaseService();

  String email = '';
  String from = '';
  String to = '';
  String date = '';
  String time = '';
  bool _isLoading = false; // For loading state

  void _bookTicket() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Ticket data
      final ticketData = {
        'email': email,
        'from': from,
        'to': to,
        'date': date,
        'time': time,
      };

      setState(() {
        _isLoading = true; // Show loading indicator
      });

      try {
        // Save ticket in Firestore
        await _firebaseService.addTicket(ticketData);

        // Notify user of success
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Booking successful! Ticket details saved.')),
        );
        // Clear the form after booking
        _formKey.currentState!.reset();
      } catch (e) {
        // Notify user of failure
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Booking failed: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false; // Hide loading indicator
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty
                    ? 'Please enter a valid email address'
                    : null,
                onSaved: (value) => email = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'From',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty
                    ? 'Please enter your departure location'
                    : null,
                onSaved: (value) => from = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'To',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your destination' : null,
                onSaved: (value) => to = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Date (e.g., 2024-12-31)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a valid travel date' : null,
                onSaved: (value) => date = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Time (e.g., 14:30)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a valid travel time' : null,
                onSaved: (value) => time = value!,
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _bookTicket,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Book Now',
                          style: TextStyle(fontSize: 18)),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
