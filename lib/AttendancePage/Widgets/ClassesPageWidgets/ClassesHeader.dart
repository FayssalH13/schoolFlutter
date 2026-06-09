import 'package:flutter/material.dart';
import '../../../../theme.dart';

class AttendanceHeader extends StatelessWidget {
  const AttendanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left side: welcome text + teacher name
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
            const SizedBox(height: 4),
            Text(
              'Mr. Ahmad',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
            ),
          ],
        ),

        const Spacer(),

        // Right side: teacher profile image
        Container(
          width: 58,
          height: 58,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: AppColors.lightBlue,
            backgroundImage: const AssetImage(
              'assets/images/teacher.png',
            ),
            onBackgroundImageError: (_, __) {},
            child: const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}