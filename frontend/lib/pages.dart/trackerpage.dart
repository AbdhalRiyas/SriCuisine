import 'package:flutter/material.dart';

class TrackerPage extends StatefulWidget {
  TrackerPage({Key? key}) : super(key: key);

  @override
  _TrackerPageState createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  // Sample data for expiry dates and ingredient names
  final List<Map<String, dynamic>> expiringToday = [
    {'ingredient': 'Ingredient A', 'expiryDate': '2024-03-22'},
    {'ingredient': 'Ingredient B', 'expiryDate': '2024-03-22'}
  ];
  final List<Map<String, dynamic>> expiringIn3Days = [
    {'ingredient': 'Ingredient C', 'expiryDate': '2024-03-25'},
    {'ingredient': 'Ingredient D', 'expiryDate': '2024-03-25'}
  ];
  final List<Map<String, dynamic>> expiringIn7Days = [
    {'ingredient': 'Ingredient E', 'expiryDate': '2024-03-29'},
    {'ingredient': 'Ingredient F', 'expiryDate': '2024-03-29'}
  ];

  List<Map<String, dynamic>>? selectedExpiryDates;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'Expiry Dates',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCategory('Expiring Today', expiringToday, Colors.red),
            const SizedBox(height: 16),
            _buildCategory(
                'Expiring In 3 Days', expiringIn3Days, Colors.orange),
            const SizedBox(height: 16),
            _buildCategory('Expiring In 7 Days', expiringIn7Days, Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(
      String title, List<Map<String, dynamic>> items, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedExpiryDates = items;
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            elevation: MaterialStateProperty.all<double>(8), // Adjust elevation
            shadowColor: MaterialStateProperty.all<Color>(
                Colors.grey), // Add shadow color
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white, // Text color
                fontWeight: FontWeight.bold, // Bold text
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (selectedExpiryDates == items)
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Expiry Dates',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Text(
                      '${items[index]['ingredient']} - ${items[index]['expiryDate']}',
                      style: const TextStyle(fontSize: 16),
                    );
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}
