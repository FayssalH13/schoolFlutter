import 'package:flutter/material.dart';
import 'package:schoolflutter/AttendancePage/Widgets/ClassesPageWidgets/ClassesCards.dart';
import 'package:schoolflutter/AttendancePage/Widgets/ClassesPageWidgets/ClassesHeader.dart';
import 'package:schoolflutter/AttendancePage/attendance_page.dart';

import '../../theme.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage({super.key});

  final List<String> classes = const [
    'Grade 10 - Section A',
    'Grade 10 - Section B',
    'Grade 11 - Section A',
    'Grade 12 - Section C',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AttendanceHeader(),

              const SizedBox(height: 28),

              Text(
                'Attendance',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
              ),

              const SizedBox(height: 6),

              Text(
                'Select a class to manage today’s attendance.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: AppColors.textGrey,
                    ),
              ),

              const SizedBox(height: 24),

              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: classes.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return ClassCard(
                      className: classes[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ClassAttendancePage(
                              className: classes[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}