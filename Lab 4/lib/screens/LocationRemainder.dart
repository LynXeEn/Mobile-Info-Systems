import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/EventProvider.dart';
import '../services/ServiceForLocation.dart';

class LocationRemindersScreen extends StatefulWidget {
  const LocationRemindersScreen({Key? key}) : super(key: key);

  @override
  State<LocationRemindersScreen> createState() => _LocationRemindersScreenState();
}

class _LocationRemindersScreenState extends State<LocationRemindersScreen> {
  final LocationService _locationService = LocationService();
  bool _isMonitoring = false;

  @override
  void initState() {
    super.initState();
    _locationService.initialize();
  }

  void _toggleMonitoring(ExamProvider examProvider) {
    setState(() {
      _isMonitoring = !_isMonitoring;
      if (_isMonitoring) {
        _locationService.startMonitoring(examProvider.exams);
      } else {
        _locationService.stopMonitoring();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Reminders'),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          Consumer<ExamProvider>(
            builder: (context, examProvider, child) {
              return Switch(
                value: _isMonitoring,
                activeColor: Colors.white,
                activeTrackColor: Colors.greenAccent,
                onChanged: (_) => _toggleMonitoring(examProvider),
              );
            },
          ),
        ],
      ),
      body: Consumer<ExamProvider>(
        builder: (context, examProvider, child) {
          final exams = examProvider.exams;

          if (exams.isEmpty) {
            return const Center(
              child: Text(
                'No exams scheduled',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: exams.length,
            itemBuilder: (context, index) {
              final exam = exams[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  title: Text(
                    exam.subject,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reminder radius: ${exam.reminderRadius.round()} meters',
                        style: const TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Status: ${exam.hasTriggeredReminder ? 'Reminded' : 'Pending'}',
                        style: TextStyle(
                          fontSize: 14,
                          color: exam.hasTriggeredReminder
                              ? Colors.green
                              : Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    exam.hasTriggeredReminder
                        ? Icons.check_circle
                        : Icons.notifications_active,
                    color: exam.hasTriggeredReminder
                        ? Colors.green
                        : Colors.orange,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}