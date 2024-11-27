import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a ticket to Firestore
  Future<void> addTicket(Map<String, dynamic> ticketData) async {
    try {
      await _firestore.collection('tickets').add(ticketData);
    } catch (e) {
      throw Exception('Failed to add ticket: $e');
    }
  }

  // Fetch all tickets from Firestore
  Future<List<Map<String, dynamic>>> getTickets() async {
    try {
      final snapshot = await _firestore.collection('tickets').get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception('Failed to fetch tickets: $e');
    }
  }

  // Update a ticket in Firestore
  Future<void> updateTicket(
      String ticketId, Map<String, dynamic> updatedData) async {
    try {
      await _firestore.collection('tickets').doc(ticketId).update(updatedData);
    } catch (e) {
      throw Exception('Failed to update ticket: $e');
    }
  }

  // Delete a ticket from Firestore
  Future<void> deleteTicket(String ticketId) async {
    try {
      await _firestore.collection('tickets').doc(ticketId).delete();
    } catch (e) {
      throw Exception('Failed to delete ticket: $e');
    }
  }
}
