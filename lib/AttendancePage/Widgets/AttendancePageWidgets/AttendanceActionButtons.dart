import 'package:flutter/material.dart';

class AttendanceActionButtons extends StatelessWidget {
  const AttendanceActionButtons({
    super.key,
    required this.onAllPresent,
    required this.onAllAbsent,
    required this.onReset,
  });

  final VoidCallback onAllPresent;
  final VoidCallback onAllAbsent;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            text: 'All Present',
            icon: Icons.bolt_rounded,
            backgroundColor: const Color(0xFFEAFBF4),
            textColor: const Color(0xFF059669),
            onTap: onAllPresent,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _ActionButton(
            text: 'All Absent',
            icon: Icons.bolt_rounded,
            backgroundColor: const Color(0xFFFFEEEE),
            textColor: const Color(0xFFDC2626),
            onTap: onAllAbsent,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _ActionButton(
            text: 'Reset',
            icon: Icons.refresh_rounded,
            backgroundColor: const Color(0xFFF1F5F9),
            textColor: const Color(0xFF64748B),
            onTap: onReset,
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 16,
          color: textColor,
        ),
        label: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}