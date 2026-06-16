import 'package:flutter/material.dart';

class ScheduleSectionHeader extends StatelessWidget {
  const ScheduleSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "TODAY'S SCHEDULE",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: Color(0xFFA4ADBD),
            letterSpacing: 0.2,
          ),
        ),

        const Spacer(),

        _LegendDot(
          color: const Color(0xFF63C95D),
          text: 'Unlocked',
        ),

        const SizedBox(width: 10),

        _LegendDot(
          color: const Color(0xFFC9CED8),
          text: 'Locked',
        ),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({
    required this.color,
    required this.text,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(width: 4),

        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Color(0xFFAAB1BE),
          ),
        ),
      ],
    );
  }
}