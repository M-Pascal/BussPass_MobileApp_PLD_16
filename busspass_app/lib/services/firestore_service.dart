import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:busspass_app/models/booking.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add Booking (Create)
  Future<void> addBooking(Booking booking) async {
    try {
      await _db.collection('bookings').add(booking.toMap());
    } catch (e) {
      print('Error adding booking: $e');
    }
  }

  // Fetch Bookings (Read)
  Future<List<Booking>> fetchBookings() async {
    try {
      var querySnapshot = await _db.collection('bookings').get();
      return querySnapshot.docs
          .map((doc) => Booking.fromMap(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching bookings: $e');
      return [];
    }
  }

  // Update Booking (Update)
  Future<void> updateBooking(String bookingId, Booking updatedBooking) async {
    try {
      await _db.collection('bookings').doc(bookingId).update(updatedBooking.toMap());
    } catch (e) {
      print('Error updating booking: $e');
    }
  }

  // Delete Booking (Delete)
  Future<void> deleteBooking(String bookingId) async {
    try {
      await _db.collection('bookings').doc(bookingId).delete();
    } catch (e) {
      print('Error deleting booking: $e');
    }
  }
}
