import 'package:flutter/material.dart';
import 'package:schoolflutter/AttendancePage/attendance_page.dart';
import 'package:schoolflutter/theme.dart';

class StudentAttendanceCard extends StatelessWidget {
  const StudentAttendanceCard({
    super.key,
    required this.name,
    required this.initials,
    required this.avatarColor,
    required this.status,
    required this.onPresent,
    required this.onLate,
    required this.onAbsent,
  });

  final String name;
  final String initials;
  final Color avatarColor;
  final AttendanceStatus status;
  final VoidCallback onPresent;
  final VoidCallback onLate;
  final VoidCallback onAbsent;

  Color get borderColor {
    switch (status) {
      case AttendanceStatus.present:
        return const Color(0xFF059669);
      case AttendanceStatus.late:
        return const Color(0xFFF59E0B);
      case AttendanceStatus.absent:
        return const Color(0xFFDC2626);
      case AttendanceStatus.none:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor,
          width: status == AttendanceStatus.none ? 0 : 1.6,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.055),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: avatarColor,
            child: Text(
              initials,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 13,
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              name,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
            ),
          ),

          _StatusButton(
            icon: Icons.check_rounded,
            isSelected: status == AttendanceStatus.present,
            selectedColor: const Color(0xFF059669),
            onTap: onPresent,
          ),

          const SizedBox(width: 6),

          _StatusButton(
            icon: Icons.access_time_rounded,
            isSelected: status == AttendanceStatus.late,
            selectedColor: const Color(0xFFF59E0B),
            onTap: onLate,
          ),

          const SizedBox(width: 6),

          _StatusButton(
            icon: Icons.close_rounded,
            isSelected: status == AttendanceStatus.absent,
            selectedColor: const Color(0xFFDC2626),
            onTap: onAbsent,
          ),
        ],
      ),
    );
  }
}

class _StatusButton extends StatelessWidget {
  const _StatusButton({
    required this.icon,
    required this.isSelected,
    required this.selectedColor,
    required this.onTap,
  });

  final IconData icon;
  final bool isSelected;
  final Color selectedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          size: 18,
          color: isSelected ? Colors.white : const Color(0xFF64748B),
        ),
      ),
    );
  }
}