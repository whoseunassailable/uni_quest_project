import 'package:flutter/material.dart';

import '../services/api_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final ApiService _apiService = ApiService();
  List<dynamic> students = [];

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  fetchStudents() async {
    try {
      var response = await _apiService.getAllStudents();
      setState(() {
        students = response.data; // Assuming your API returns a list
      });
      return students;
    } catch (e) {
      print('Error: $e');
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Students')),
      body: students.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Text('Hello World'),
            ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        final finalData = fetchStudents();
        print(finalData);
      }),
    );
  }
}
