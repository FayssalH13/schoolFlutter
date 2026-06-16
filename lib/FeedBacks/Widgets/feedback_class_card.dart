import 'package:flutter/material.dart';
import 'package:schoolflutter/FeedBacks/feedback_class_model.dart';

class FeedbackClassCard extends StatelessWidget {
  const FeedbackClassCard({
    super.key,
    required this.classItem,
    this.onTap,
  });

  final FeedbackClassModel classItem;
  final VoidCallback? onTap;

  bool get isUnlocked => classItem.attendanceTaken;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isUnlocked ? 1 : 0.38,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 4,
                decoration: BoxDecoration(
                  color: isUnlocked
                      ? const Color(0xFF1976D2)
                      : const Color(0xFFD8DDE8),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              const SizedBox(width: 3),

              Expanded(
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 76,
                  ),
                  padding: const EdgeInsets.fromLTRB(14, 13, 12, 13),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: const Color(0xFFEEF1F8),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF253858).withOpacity(0.07),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      _BookIconBox(isUnlocked: isUnlocked),

                      const SizedBox(width: 13),

                      Expanded(
                        child: _ClassInfo(
                          classItem: classItem,
                          isUnlocked: isUnlocked,
                        ),
                      ),

                      const SizedBox(width: 8),

                      _ActionIcon(isUnlocked: isUnlocked),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookIconBox extends StatelessWidget {
  const _BookIconBox({
    required this.isUnlocked,
  });

  final bool isUnlocked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: isUnlocked
            ? const Color(0xFFEAF6FF)
            : const Color(0xFFF3F5FA),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(
        Icons.menu_book_rounded,
        size: 22,
        color: isUnlocked
            ? const Color(0xFF2F8DE4)
            : const Color(0xFFC2C8D4),
      ),
    );
  }
}

class _ClassInfo extends StatelessWidget {
  const _ClassInfo({
    required this.classItem,
    required this.isUnlocked,
  });

  final FeedbackClassModel classItem;
  final bool isUnlocked;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final badgeCanFit = constraints.maxWidth > 145;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    classItem.className,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      height: 1.1,
                      fontWeight: FontWeight.w800,
                      color: isUnlocked
                          ? const Color(0xFF1F2937)
                          : const Color(0xFF8D96A8),
                    ),
                  ),
                ),

                if (badgeCanFit) ...[
                  const SizedBox(width: 8),
                  _AttendanceBadge(isUnlocked: isUnlocked),
                ],
              ],
            ),

            if (!badgeCanFit) ...[
              const SizedBox(height: 5),
              _AttendanceBadge(isUnlocked: isUnlocked),
            ],

            const SizedBox(height: 5),

            Text(
              '${classItem.subject} · ${classItem.room}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                height: 1.1,
                fontWeight: FontWeight.w600,
                color: isUnlocked
                    ? const Color(0xFF9BA4B5)
                    : const Color(0xFFBBC1CC),
              ),
            ),

            const SizedBox(height: 4),

            Text(
              '${classItem.time} · ${classItem.studentsCount} students',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                height: 1.1,
                fontWeight: FontWeight.w600,
                color: isUnlocked
                    ? const Color(0xFFA7AFBD)
                    : const Color(0xFFC3C9D4),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _AttendanceBadge extends StatelessWidget {
  const _AttendanceBadge({
    required this.isUnlocked,
  });

  final bool isUnlocked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: isUnlocked
            ? const Color(0xFFE7F8E7)
            : const Color(0xFFF1F3F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isUnlocked ? 'Attendance ✓' : 'No Attendance',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 8,
          height: 1,
          fontWeight: FontWeight.w800,
          color: isUnlocked
              ? const Color(0xFF45B93F)
              : const Color(0xFFB1B8C4),
        ),
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  const _ActionIcon({
    required this.isUnlocked,
  });

  final bool isUnlocked;

  @override
  Widget build(BuildContext context) {
    if (isUnlocked) {
      return Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          color: Color(0xFFEAF6FF),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.chevron_right_rounded,
          color: Color(0xFF2F8DE4),
          size: 25,
        ),
      );
    }

    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        color: Color(0xFFF1F3F8),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.lock_outline_rounded,
        color: Color(0xFFB8C0CD),
        size: 16,
      ),
    );
  }
}