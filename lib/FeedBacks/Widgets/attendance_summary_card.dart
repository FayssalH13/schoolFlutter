import 'package:flutter/material.dart';

class AttendanceSummaryCard extends StatelessWidget {
  const AttendanceSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 13, 16, 13),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.17),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 4,
            child: _AttendanceText(),
          ),

          const SizedBox(width: 14),

          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: LinearProgressIndicator(
                value: 0.4,
                minHeight: 8,
                backgroundColor: Colors.white24,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(width: 14),

          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.16),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.assignment_turned_in_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _AttendanceText extends StatelessWidget {
  const _AttendanceText();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attendance taken',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Color(0xFFE2F0FF),
          ),
        ),

        SizedBox(height: 3),

        Text(
          '2 / 5 classes',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            height: 1.1,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}