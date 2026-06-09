import 'package:flutter/material.dart';
import 'package:schoolflutter/theme.dart';


class AttendanceTopHeader extends StatelessWidget {
  const AttendanceTopHeader({
    super.key,
    required this.teacherName,
    required this.onBack,
  });

  final String teacherName;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onBack,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: AppColors.textDark,
          ),
        ),

        const SizedBox(width: 4),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back,',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 13,
                    color: AppColors.textGrey,
                  ),
            ),
            const SizedBox(height: 2),
            Text(
              teacherName,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
            ),
          ],
        ),

        const Spacer(),

        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.lightBlue,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'MA',
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}