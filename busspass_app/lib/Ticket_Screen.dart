import 'package:flutter/material.dart';
// ignore: unused_import
//import 'package:qr_flutter/qr_flutter.dart';

// Sample Ticket class to hold ticket data
class Ticket {
  final String companyName;
  final String passengerName;
  final String username;
  final String ticketNo;
  final String bookedDate;
  final String departureTime;
  final String from;
  final String to;
  final String numberSeats;
  final String ticketFee;
  final String paymentStatus;
  final String paymentDate;
  final String paymentTime;

  Ticket({
    required this.companyName,
    required this.passengerName,
    required this.username,
    required this.ticketNo,
    required this.bookedDate,
    required this.departureTime,
    required this.from,
    required this.to,
    required this.numberSeats,
    required this.ticketFee,
    required this.paymentStatus,
    required this.paymentDate,
    required this.paymentTime,
  });
}

void main() => runApp(TicketApp());

class TicketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket History',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicketHistoryScreen(),
    );
  }
}

class TicketHistoryScreen extends StatefulWidget {
  @override
  _TicketHistoryScreenState createState() => _TicketHistoryScreenState();
}

class _TicketHistoryScreenState extends State<TicketHistoryScreen> {
  List<Ticket> tickets = [
    Ticket(
      companyName: "RITCO Ltd.",
      passengerName: "John Doe",
      username: "johndoe",
      ticketNo: "123-456",
      bookedDate: "05/10/2024",
      departureTime: "16:30",
      from: "Kigali",
      to: "Kampala",
      numberSeats: "2",
      ticketFee: "50,000 UGX",
      paymentStatus: "Done",
      paymentDate: "05/10/2024",
      paymentTime: "10:14",
    ),
    Ticket(
      companyName: "KBS Co.",
      passengerName: "Jane Smith",
      username: "janesmith",
      ticketNo: "789-012",
      bookedDate: "04/10/2024",
      departureTime: "14:00",
      from: "Nairobi",
      to: "Mombasa",
      numberSeats: "1",
      ticketFee: "30,000 KES",
      paymentStatus: "Done",
      paymentDate: "04/10/2024",
      paymentTime: "09:00",
    ),
    Ticket(
      companyName: "Trinity Buses",
      passengerName: "Alice Brown",
      username: "alicebrown",
      ticketNo: "345-678",
      bookedDate: "03/10/2024",
      departureTime: "12:00",
      from: "Dar es Salaam",
      to: "Arusha",
      numberSeats: "3",
      ticketFee: "45,000 TZS",
      paymentStatus: "Pending",
      paymentDate: "N/A",
      paymentTime: "N/A",
    ),
    Ticket(
      companyName: "Easy Coach",
      passengerName: "Mike Davis",
      username: "mikedavis",
      ticketNo: "901-234",
      bookedDate: "02/10/2024",
      departureTime: "09:30",
      from: "Nakuru",
      to: "Eldoret",
      numberSeats: "4",
      ticketFee: "25,000 KES",
      paymentStatus: "Done",
      paymentDate: "02/10/2024",
      paymentTime: "08:15",
    ),
    Ticket(
      companyName: "Modern Coast",
      passengerName: "Sarah Johnson",
      username: "sarahjohnson",
      ticketNo: "567-890",
      bookedDate: "01/10/2024",
      departureTime: "07:00",
      from: "Kisumu",
      to: "Nairobi",
      numberSeats: "1",
      ticketFee: "35,000 KES",
      paymentStatus: "Done",
      paymentDate: "01/10/2024",
      paymentTime: "06:00",
    ),
    Ticket(
      companyName: "Akamba Safaris",
      passengerName: "Chris Evans",
      username: "chrisevans",
      ticketNo: "112-233",
      bookedDate: "30/09/2024",
      departureTime: "15:45",
      from: "Kampala",
      to: "Gulu",
      numberSeats: "2",
      ticketFee: "40,000 UGX",
      paymentStatus: "Pending",
      paymentDate: "N/A",
      paymentTime: "N/A",
    ),
  ];

  List<Ticket> filteredTickets = [];

  @override
  void initState() {
    super.initState();
    filteredTickets = tickets;
  }

  void _filterTickets(String query) {
    setState(() {
      filteredTickets = tickets
          .where((ticket) =>
              ticket.ticketNo.contains(query) ||
              ticket.bookedDate.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "Tickets",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterTickets,
              decoration: InputDecoration(
                hintText: "Search...",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tickets History',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: filteredTickets.map((ticket) {
                return TicketCard(
                  ticketNo: ticket.ticketNo,
                  date: ticket.bookedDate,
                  time: ticket.departureTime,
                  onViewDetails: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return _buildTicketDetailsPopup(ticket);
                      },
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number), label: 'Tickets'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildTicketDetailsPopup(Ticket ticket) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Ticket Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          _buildTicketInfoRow('Company Name:', ticket.companyName),
          _buildTicketInfoRow('Passenger Name:', ticket.passengerName),
          _buildTicketInfoRow('Username:', ticket.username),
          _buildTicketInfoRow('Ticket No:', ticket.ticketNo),
          _buildTicketInfoRow('Booked Date:', ticket.bookedDate),
          _buildTicketInfoRow('Departure Time:', ticket.departureTime),
          _buildTicketInfoRow('From:', ticket.from),
          _buildTicketInfoRow('To:', ticket.to),
          _buildTicketInfoRow('Number of Seats:', ticket.numberSeats),
          _buildTicketInfoRow('Ticket Fee:', ticket.ticketFee),
          SizedBox(height: 10),
          _buildTicketInfoRow('Payment Status:', ticket.paymentStatus),
          _buildTicketInfoRow('Date:', ticket.paymentDate),
          _buildTicketInfoRow('Time:', ticket.paymentTime),
          SizedBox(height: 20),
          Container(
            width: 100,
            height: 80,
            color:const Color.fromARGB(206, 0, 0, 0),
            child: Center(
              child: Text(
                'QR CODE',
                
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Back'),
              ),
              ElevatedButton(
                onPressed: () {
                  _generatePdf(ticket);
                },
                child: Text('Download'),
          ),
        ],
      ),
        ]
    )
    );
  }

  Widget _buildTicketInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}

void _generatePdf(Ticket ticket) {
}

class TicketCard extends StatelessWidget {
  final String ticketNo;
  final String date;
  final String time;
  final VoidCallback onViewDetails;

  const TicketCard({
    Key? key,
    required this.ticketNo,
    required this.date,
    required this.time,
    required this.onViewDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ticket No: $ticketNo',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Date: $date'),
                Text('Time: $time'),
                TextButton(
                  onPressed: onViewDetails,
                  child: Text('View Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
