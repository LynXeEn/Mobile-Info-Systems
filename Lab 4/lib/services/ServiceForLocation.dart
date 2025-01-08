import 'package:geolocator/geolocator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../models/StudentExamModel.dart';

class LocationService {
  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
  bool _isMonitoring = false;

  Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSettings);
    await _notifications.initialize(initSettings);
  }

  Future<void> startMonitoring(List<Exam> exams) async {
    if (_isMonitoring) return;
    _isMonitoring = true;

    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      return;
    }

    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      if (!_isMonitoring) return; // Exit if monitoring is stopped
      _checkExamProximity(position, exams);
    });
  }

  Future<void> _checkExamProximity(Position position, List<Exam> exams) async {
    for (final exam in exams) {
      if (exam.hasTriggeredReminder) continue;

      final distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        exam.location.latitude,
        exam.location.longitude,
      );

      if (distance <= exam.reminderRadius) {
        await _showNotification(
          exam.subject,
          'You are near your exam location! Prepare yourself.',
        );
        exam.hasTriggeredReminder = true;
      }
    }
  }

  Future<void> _showNotification(String title, String body) async {
    const androidDetails = AndroidNotificationDetails(
      'exam_location_reminders',
      'Exam Location Reminders',
      channelDescription: 'Notifications for exam location proximity.',
      importance: Importance.high,
      priority: Priority.high,
    );
    const details = NotificationDetails(android: androidDetails);

    await _notifications.show(
      DateTime.now().millisecondsSinceEpoch.remainder(100000),
      title,
      body,
      details,
    );
  }

  void stopMonitoring() {
    _isMonitoring = false;
  }
}
