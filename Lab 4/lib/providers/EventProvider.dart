import 'package:flutter/foundation.dart';
import '../models/StudentExamModel.dart';

class ExamProvider with ChangeNotifier {
  final List<Exam> _exams = [];

  List<Exam> get exams => List.unmodifiable(_exams);

  void addExam(Exam exam) {
    _exams.add(exam);
    notifyListeners();
  }

  List<Exam> getExamsForDay(DateTime day) {
    return _exams.where((exam) {
      final examDate = exam.dateTime;
      return examDate.year == day.year &&
          examDate.month == day.month &&
          examDate.day == day.day;
    }).toList();
  }

  void removeExam(Exam exam) {
    _exams.remove(exam);
    notifyListeners();
  }

  void updateExam(Exam oldExam, Exam updatedExam) {
    final index = _exams.indexOf(oldExam);
    if (index != -1) {
      _exams[index] = updatedExam;
      notifyListeners();
    }
  }

  void clearExams() {
    _exams.clear();
    notifyListeners();
  }
}
