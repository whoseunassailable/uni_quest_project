import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_quest_project/core/utils/appbar.dart';
import 'package:uni_quest_project/l10n/app_localizations.dart';

class ClassifyYourUniPage extends StatefulWidget {
  const ClassifyYourUniPage({super.key});

  @override
  State<ClassifyYourUniPage> createState() => _ClassifyYourUniPageState();
}

// class _ClassifyYourUniPageState extends State<ClassifyYourUniPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: StylishAppBar(title: AppLocalizations.of(context).classifyYourUni,),);
//   }
// }
class _ClassifyYourUniPageState extends State<ClassifyYourUniPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9A7659),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF18B38),
        elevation: 0,
        title: const Text(
          'CLASSIFY YOUR UNI',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Handle filter action
            },
            icon: const Icon(Icons.filter_alt_outlined, color: Colors.black),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFEFAF1),
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        ),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildUniversityCard("SAFE", Colors.green),
            const SizedBox(height: 16),
            _buildUniversityCard("TARGET", Colors.orange),
            const SizedBox(height: 16),
            _buildUniversityCard("DREAM", Colors.red),
            const SizedBox(height: 16),
            _buildUniversityCard("SAFE", Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildUniversityCard(String classification, Color classificationColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Icon circle
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.orange,
            child: Icon(Icons.school, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 12),
          // University info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'UNIVERSITY NAME',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                ),
                Text(
                  'ADDRESS',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text('GRE SCORE  ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('GPA  ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Icon(Icons.school_outlined, size: 20),
                  ],
                ),
                Row(
                  children: [
                    Text('TOEFL SCORE  ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('COURSE  ', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Status + button
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('89%', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 4),
              Text(
                classification,
                style: TextStyle(
                  fontSize: 14,
                  color: classificationColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Icon(Icons.favorite, color: Colors.red),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Handle Apply Now
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('APPLY NOW'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
