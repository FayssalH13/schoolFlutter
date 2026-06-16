import 'package:flutter/material.dart';

class FeedbackClassModel {
  const FeedbackClassModel({
    required this.className,
    required this.subject,
    required this.room,
    required this.time,
    required this.studentsCount,
    required this.attendanceTaken,
  });

  final String className;
  final String subject;
  final String room;
  final String time;
  final int studentsCount;
  final bool attendanceTaken;
}