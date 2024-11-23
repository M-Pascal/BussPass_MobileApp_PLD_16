class Booking {
  final String companyName;
  final String plateNo;
  final String from;
  final String to;
  final String departureTime;
  final String passengerName;
  final int numberOfSeats;
  final int luggageQty;
  final double totalFare;

  Booking({
    required this.companyName,
    required this.plateNo,
    required this.from,
    required this.to,
    required this.departureTime,
    required this.passengerName,
    required this.numberOfSeats,
    required this.luggageQty,
    required this.totalFare,
  });

  Map<String, dynamic> toMap() {
    return {
      'companyName': companyName,
      'plateNo': plateNo,
      'from': from,
      'to': to,
      'departureTime': departureTime,
      'passengerName': passengerName,
      'numberOfSeats': numberOfSeats,
      'luggageQty': luggageQty,
      'totalFare': totalFare,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      companyName: map['companyName'],
      plateNo: map['plateNo'],
      from: map['from'],
      to: map['to'],
      departureTime: map['departureTime'],
      passengerName: map['passengerName'],
      numberOfSeats: map['numberOfSeats'],
      luggageQty: map['luggageQty'],
      totalFare: map['totalFare'],
    );
  }
}
