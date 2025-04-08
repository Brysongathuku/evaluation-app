import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {
      'code': 'CCS 3354',
      'name': 'Data Mining',
      'lecturer': 'Dr Amos Chege',
      'status': 'Pending',
      'deadline': 'April 15, 2025'
    },
    {
      'code': 'CCS 3351',
      'name': 'Distributed Systems',
      'lecturer': 'P. Njuguna',
      'status': 'Pending',
      'deadline': 'April 15, 2025'
    },
    {
      'code': 'CCS 3253',
      'name': 'Network Management',
      'lecturer': 'E. Kangaru',
      'status': 'Pending',
      'deadline': 'N/A'
    },
    {
      'code': 'CIT 3350',
      'name': 'Mobile Development',
      'lecturer': 'J. Jenu',
      'status': 'Pending',
      'deadline': 'N/A'
    },
    {
      'code': 'CIT 3355',
      'name': 'Compiler Construction',
      'lecturer': 'K. Gogo',
      'status': 'Pending',
      'deadline': 'April 15, 2025'
    },
    {
      'code': 'SMS 3350',
      'name': 'Operations Research',
      'lecturer': 'J. Murungi',
      'status': 'Pending',
      'deadline': 'April 15, 2025'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course['code']!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(course['name']!, style: TextStyle(fontSize: 18)),
                  Divider(),
                  Text('Lecturer: ${course['lecturer']}'),
                  Text('Status: ${course['status']}'),
                  if (course['deadline'] != 'N/A')
                    Text('Deadline: ${course['deadline']}'),
                  SizedBox(height: 8),
                  if (course['status'] == 'Pending')
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the "Evaluate Lecturer" screen with course info
                      },
                      child: Text('Evaluate Lecturer'),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
