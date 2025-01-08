import 'package:flutter/material.dart';
import 'CalendarScreen.dart';
import 'NewExamScreen.dart';
import 'LocationRemainder.dart';
import 'ScreenOfMap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Exam Schedule - Jovan Stojanovski 213137'),
        elevation: 2,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurpleAccent.withOpacity(0.1), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildMenuCard(
                      context,
                      'View Schedule',
                      Icons.calendar_today,
                      Colors.teal,
                          () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CalendarScreen()),
                      ),
                    ),
                    _buildMenuCard(
                      context,
                      'Add Exam',
                      Icons.add_circle,
                      Colors.orange,
                          () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddExamScreen()),
                      ),
                    ),
                    _buildMenuCard(
                      context,
                      'View Map',
                      Icons.map,
                      Colors.indigo,
                          () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MapScreen()),
                      ),
                    ),
                    _buildMenuCard(
                      context,
                      'Location Reminders',
                      Icons.location_on,
                      Colors.purpleAccent,
                          () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LocationRemindersScreen()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
