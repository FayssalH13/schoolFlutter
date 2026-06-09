import 'package:flutter/material.dart';
import 'package:schoolflutter/theme.dart';


class AttendanceCounterCard extends StatelessWidget {
  const AttendanceCounterCard({
    super.key,
    required this.count,
    required this.label,
    required this.color,
    required this.backgroundColor,
  });

  final int count;
  final String label;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textGrey,
                ),
          ),
        ],
      ),
    );
  }
}