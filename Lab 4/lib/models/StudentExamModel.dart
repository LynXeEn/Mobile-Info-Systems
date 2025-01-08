class ExamLocation {
  final double latitude;
  final double longitude;
  final String address;

  ExamLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  @override
  String toString() => 'ExamLocation(latitude: $latitude, longitude: $longitude, address: $address)';
}

class Exam {
  final String subject;
  final DateTime dateTime;
  final ExamLocation location;
  final double reminderRadius;
  bool hasTriggeredReminder;

  Exam({
    required this.subject,
    required this.dateTime,
    required this.location,
    this.reminderRadius = 500.0,
    this.hasTriggeredReminder = false,
  });

  String getFormattedDateTime() {
    return "${dateTime.toLocal().toString().split(' ')[0]} at ${dateTime.toLocal().toString().split(' ')[1].substring(0, 5)}";
  }

  @override
  String toString() {
    return 'Exam(subject: $subject, dateTime: ${getFormattedDateTime()}, location: $location, reminderRadius: $reminderRadius, hasTriggeredReminder: $hasTriggeredReminder)';
  }
}
