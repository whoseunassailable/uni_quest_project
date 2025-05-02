import 'package:flutter/material.dart';


class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  // Mock data for past searches
  final List<Map<String, String>> historyItems = const [
    {
      'date': 'Apr 10, 2025',
      'toefl': '105',
      'gpa': '3.8',
      'gre': '320',
      'dept': 'CS Department'
    },
    {
      'date': 'Apr 10, 2025',
      'toefl': '105',
      'gpa': '3.8',
      'gre': '320',
      'dept': 'CS Department'
    },
    {
      'date': 'Apr 10, 2025',
      'toefl': '105',
      'gpa': '3.8',
      'gre': '320',
      'dept': 'CS Department'
    },
    {
      'date': 'Apr 10, 2025',
      'toefl': '105',
      'gpa': '3.8',
      'gre': '320',
      'dept': 'CS Department'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCC80),
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFDF7EF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hey there! 👋 Here’s what you’ve searched for",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: historyItems.length,
                itemBuilder: (context, index) {
                  final item = historyItems[index];
                  return HistoryCard(
                    date: item['date']!,
                    toefl: item['toefl']!,
                    gpa: item['gpa']!,
                    gre: item['gre']!,
                    department: item['dept']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String date, toefl, gpa, gre, department;

  const HistoryCard({
    super.key,
    required this.date,
    required this.toefl,
    required this.gpa,
    required this.gre,
    required this.department,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange[300],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  'Date: $date',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("TOEFL: $toefl"),
                Text("GPA: $gpa"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("GRE: $gre"),
                Text(department),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to result details
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text('View Results'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
