import 'package:flutter/material.dart';


class Booking extends StatefulWidget {
  const Booking({super.key});


  @override
  State<Booking> createState() => _BookingState();
}


class _BookingState extends State<Booking> {
  final List<Map<String, String>> tickets = [
    {
      'title': 'KIGALI COACH',
      'date': '12 Nov 2024',
      'time': '18:00',
      'from': 'Kigali',
      'destination': 'Musanze',
      'price': '5,000 RWF',
      'image': 'assets/bus_image.png',
    },
    {
      'title': 'RITCO',
      'date': '15 Nov 2024',
      'time': '20:00',
      'from': 'Huye',
      'destination': 'Kigali',
      'price': '8,000 RWF',
      'image': 'assets/bus_image.png',
    },
    {
      'title': 'VIRUNGA',
      'date': '20 Nov 2024',
      'time': '21:00',
      'from': 'Rubavu',
      'destination': 'Kigali',
      'price': '6,500 RWF',
      'image': 'assets/bus_image.png',
    },
    {
      'title': 'VIRUNGA',
      'date': '20 Nov 2024',
      'time': '21:00',
      'from': 'Rubavu',
      'destination': 'Kigali',
      'price': '6,500 RWF',
      'image': 'assets/bus_image.png',
    },
  ];


 final List<Map<String, dynamic>> weatherData = [
  {
    'temperature': '28°C',
    'condition': 'Cloudy',
    'city': 'Kigali City',
    'country': 'Rwanda',
  },
  {
    'temperature': '32°C',
    'condition': 'Warm',
    'city': 'Bugesera',
    'country': 'Rwanda',
  },
  {
    'temperature': '21°C',
    'condition': 'Rainy',
    'city': 'Burera',
    'country': 'Rwanda',
  },
  {
    'temperature': '28°C',
    'condition': 'Lightning',
    'city': 'Rutsiro',
    'country': 'Rwanda',
  },
];

Widget _getWeatherIcon(String condition) {
  IconData iconData;
  switch (condition.toLowerCase()) {
    case 'cloudy':
      iconData = Icons.cloud;
      break;
    case 'warm':
      iconData = Icons.wb_sunny;
      break;
    case 'rainy':
      iconData = Icons.grain;
      break;
    case 'lightning':
      iconData = Icons.flash_on;
      break;
    default:
      iconData = Icons.cloud;
  }
  return Icon(
    iconData,
    color: Colors.white,
    size: 24,
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                // Upper blue section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Booking',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Book Ticket With Us....',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[600],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search..',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Icon(Icons.search),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                const Row(
                  children: [
                    Text(
                      'Upcoming Tickets',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Updated ticket container
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 250,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tickets.length,
                    itemBuilder: (context, index) {
                      final ticket = tickets[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                        child: InkWell(
                          onTap: () {
                            // Ticket tap action
                          },
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.85,
                              minWidth: 300,
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0.5),
                                    child: Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[900],
                                        borderRadius: const BorderRadius.horizontal(
                                          left: Radius.circular(15),
                                        ),
                                      ),
                                      child: Center(
                                        child: RotatedBox(
                                          quarterTurns: 3,
                                          child: Text(
                                            'Bus #${index + 1}',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        borderRadius: const BorderRadius.horizontal(
                                          right: Radius.circular(15),
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 12, top:12),
                                            child: Text(
                                              ticket['title'] ?? 'No Title',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Flexible(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      _buildInfoRow(
                                                        Icons.calendar_today,
                                                        ticket['date'] ?? 'No date',
                                                      ),
                                                      const SizedBox(height: 5),
                                                      _buildInfoRow(
                                                        Icons.access_time,
                                                        ticket['time'] ?? 'No time',
                                                      ),
                                                      const SizedBox(height: 5),
                                                      _buildInfoRow(
                                                        Icons.location_on_outlined,
                                                        'From ${ticket['from']} to ${ticket['destination']}',
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Image.asset(
                                                      ticket['image'] ?? 'image',
                                                      width: 75,
                                                      height: 60,
                                                      fit: BoxFit.contain,
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      ticket['price'] ?? 'price',
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton.icon(
                                              onPressed: () {
                                                // Button action
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                padding: const EdgeInsets.symmetric(vertical: 8),
                                              ),
                                              icon: const Icon(Icons.book_online, size: 18),
                                              label: const Text('Book Now', style: TextStyle(color: Colors.white),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Weather Forecast Section
                Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Weather Forecast',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                const Text(
                  'Today',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 8),
                Icon(Icons.tune, size: 16, color: Colors.grey[600]),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 16),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
        ),
        itemCount: weatherData.length,
        itemBuilder: (context, index) {
          final data = weatherData[index];
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1a237e), // Dark blue color
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      data['temperature'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    _getWeatherIcon(data['condition']),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  data['condition'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  '${data['city']},',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  data['country'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ],
  ),
)

              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildInfoRow(IconData icon, String info) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 18,
        ),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            info,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
