import 'package:flutter/material.dart';
import 'package:schoolflutter/AttendancePage/Widgets/AttendancePageWidgets/AttendanceActionButtons.dart';
import 'package:schoolflutter/AttendancePage/Widgets/AttendancePageWidgets/AttendanceClassInfoCard.dart';
import 'package:schoolflutter/AttendancePage/Widgets/AttendancePageWidgets/AttendanceCounterCard.dart';
import 'package:schoolflutter/AttendancePage/Widgets/AttendancePageWidgets/AttendanceProgressBar.dart';
import 'package:schoolflutter/AttendancePage/Widgets/AttendancePageWidgets/AttendanceSearchField.dart';
import 'package:schoolflutter/AttendancePage/Widgets/AttendancePageWidgets/AttendanceSubmitButton.dart';
import 'package:schoolflutter/AttendancePage/Widgets/AttendancePageWidgets/AttendanceTopHeader.dart';
import 'package:schoolflutter/AttendancePage/Widgets/AttendancePageWidgets/StudentAttendanceCard.dart';

import '../theme.dart';

enum AttendanceStatus {
  none,
  present,
  late,
  absent,
}

class StudentAttendanceItem {
  StudentAttendanceItem({
    required this.name,
    required this.initials,
    required this.avatarColor,
    this.status = AttendanceStatus.none,
  });

  final String name;
  final String initials;
  final Color avatarColor;
  AttendanceStatus status;
}

class ClassAttendancePage extends StatefulWidget {
  const ClassAttendancePage({
    super.key,
    required this.className,
  });

  final String className;

  @override
  State<ClassAttendancePage> createState() => _ClassAttendancePageState();
}

class _ClassAttendancePageState extends State<ClassAttendancePage> {
  final TextEditingController searchController = TextEditingController();

  String searchQuery = '';

  final List<StudentAttendanceItem> students = [
    StudentAttendanceItem(
      name: 'Aaray Patel',
      initials: 'AP',
      avatarColor: const Color(0xFF6D5DF6),
    ),
    StudentAttendanceItem(
      name: 'Bella Nguyen',
      initials: 'BN',
      avatarColor: const Color(0xFF0EA5E9),
    ),
    StudentAttendanceItem(
      name: 'Carlos Rivera',
      initials: 'CR',
      avatarColor: const Color(0xFF059669),
    ),
    StudentAttendanceItem(
      name: 'Diana Chen',
      initials: 'DC',
      avatarColor: const Color(0xFFF97316),
    ),
    StudentAttendanceItem(
      name: 'Ethan Moore',
      initials: 'EM',
      avatarColor: const Color(0xFFDB2777),
    ),
    StudentAttendanceItem(
      name: 'Fatima Ali',
      initials: 'FA',
      avatarColor: const Color(0xFF2563EB),
    ),
    StudentAttendanceItem(
      name: 'George Haddad',
      initials: 'GH',
      avatarColor: const Color(0xFF7C3AED),
    ),
    StudentAttendanceItem(
      name: 'Lara Mansour',
      initials: 'LM',
      avatarColor: const Color(0xFF0891B2),
    ),
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  int get presentCount {
    return students.where((s) => s.status == AttendanceStatus.present).length;
  }

  int get lateCount {
    return students.where((s) => s.status == AttendanceStatus.late).length;
  }

  int get absentCount {
    return students.where((s) => s.status == AttendanceStatus.absent).length;
  }

  int get markedCount {
    return students.where((s) => s.status != AttendanceStatus.none).length;
  }

  bool get isAttendanceComplete {
    return markedCount == students.length;
  }

  double get progress {
    if (students.isEmpty) return 0;
    return markedCount / students.length;
  }

  List<StudentAttendanceItem> get filteredStudents {
    if (searchQuery.trim().isEmpty) return students;

    return students.where((student) {
      return student.name.toLowerCase().contains(
            searchQuery.trim().toLowerCase(),
          );
    }).toList();
  }

  void updateStudentStatus(
    StudentAttendanceItem student,
    AttendanceStatus status,
  ) {
    closeKeyboard();

    setState(() {
      student.status = status;
    });
  }

  void markAllPresent() {
    closeKeyboard();

    setState(() {
      for (final student in students) {
        student.status = AttendanceStatus.present;
      }
    });
  }

  void markAllAbsent() {
    closeKeyboard();

    setState(() {
      for (final student in students) {
        student.status = AttendanceStatus.absent;
      }
    });
  }

  void resetAttendance() {
    closeKeyboard();

    setState(() {
      for (final student in students) {
        student.status = AttendanceStatus.none;
      }
    });
  }

  void submitAttendance() {
    closeKeyboard();

    if (!isAttendanceComplete) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Attendance submitted successfully.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeyboard,
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: true,

        body: SafeArea(
          child: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      AttendanceTopHeader(
                        teacherName: 'Mr. Ahmad',
                        onBack: () {
                          closeKeyboard();
                          Navigator.pop(context);
                        },
                      ),

                      const SizedBox(height: 20),

                      AttendanceClassInfoCard(
                        className: widget.className,
                        subtitle: 'Wed, Jun 10 · Math',
                      ),

                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Expanded(
                            child: AttendanceCounterCard(
                              count: presentCount,
                              label: 'Present',
                              color: const Color(0xFF059669),
                              backgroundColor: const Color(0xFFEAFBF4),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: AttendanceCounterCard(
                              count: lateCount,
                              label: 'Late',
                              color: const Color(0xFFF59E0B),
                              backgroundColor: const Color(0xFFFFF7E6),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: AttendanceCounterCard(
                              count: absentCount,
                              label: 'Absent',
                              color: const Color(0xFFDC2626),
                              backgroundColor: const Color(0xFFFFEEEE),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      AttendanceProgressBar(
                        progress: progress,
                        markedCount: markedCount,
                        totalCount: students.length,
                      ),

                      const SizedBox(height: 16),

                      AttendanceActionButtons(
                        onAllPresent: markAllPresent,
                        onAllAbsent: markAllAbsent,
                        onReset: resetAttendance,
                      ),

                      const SizedBox(height: 14),

                      AttendanceSearchField(
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),

              if (filteredStudents.isEmpty)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      alignment: Alignment.center,
                      child: Text(
                        'No students found.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.textGrey,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList.separated(
                    itemCount: filteredStudents.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final student = filteredStudents[index];

                      return StudentAttendanceCard(
                        name: student.name,
                        initials: student.initials,
                        avatarColor: student.avatarColor,
                        status: student.status,
                        onPresent: () {
                          updateStudentStatus(
                            student,
                            AttendanceStatus.present,
                          );
                        },
                        onLate: () {
                          updateStudentStatus(
                            student,
                            AttendanceStatus.late,
                          );
                        },
                        onAbsent: () {
                          updateStudentStatus(
                            student,
                            AttendanceStatus.absent,
                          );
                        },
                      );
                    },
                  ),
                ),

              const SliverToBoxAdapter(
                child: SizedBox(height: 100),
              ),
            ],
          ),
        ),

        bottomNavigationBar: SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 14),
            color: AppColors.white,
            child: AttendanceSubmitButton(
              isEnabled: isAttendanceComplete,
              onPressed: submitAttendance,
            ),
          ),
        ),
      ),
    );
  }
}