import 'package:flutter/material.dart';
import 'package:schoolflutter/FeedBacks/Widgets/feedback_class_card.dart';
import 'package:schoolflutter/FeedBacks/Widgets/feedback_top_header.dart';
import 'package:schoolflutter/FeedBacks/Widgets/feedback_warning_box.dart';
import 'package:schoolflutter/FeedBacks/Widgets/schedule_section_header.dart';
import 'feedback_class_model.dart';

class FeedbackClassesPage extends StatelessWidget {
  const FeedbackClassesPage({super.key});

  static const List<FeedbackClassModel> classes = [
    FeedbackClassModel(
      className: 'Class 5A',
      subject: 'Mathematics',
      room: 'Room 12',
      time: '8:00 – 9:30 AM',
      studentsCount: 28,
      attendanceTaken: true,
    ),
    FeedbackClassModel(
      className: 'Class 4B',
      subject: 'Science',
      room: 'Room 7',
      time: '10:00 – 11:30 AM',
      studentsCount: 24,
      attendanceTaken: true,
    ),
    FeedbackClassModel(
      className: 'Class 6A',
      subject: 'Mathematics',
      room: 'Room 3',
      time: '12:00 – 1:30 PM',
      studentsCount: 30,
      attendanceTaken: false,
    ),
    FeedbackClassModel(
      className: 'Class 3C',
      subject: 'English',
      room: 'Room 9',
      time: '2:00 – 3:30 PM',
      studentsCount: 22,
      attendanceTaken: false,
    ),
    FeedbackClassModel(
      className: 'Class 5B',
      subject: 'Mathematics',
      room: 'Room 12',
      time: '3:45 – 5:00 PM',
      studentsCount: 26,
      attendanceTaken: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FE),
      body: Column(
        children: [
          const FeedbackTopHeader(),

          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
              children: [
                const ScheduleSectionHeader(),

                const SizedBox(height: 12),

                ...classes.map(
                  (classItem) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: FeedbackClassCard(
                      classItem: classItem,
                      onTap: classItem.attendanceTaken
                          ? () {
                              // Navigate to feedback details page later.
                            }
                          : null,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                const FeedbackWarningBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}