import 'package:flutter/material.dart';
import 'attendance_summary_card.dart';

class FeedbackTopHeader extends StatelessWidget {
  const FeedbackTopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: topPadding + 18,
        left: 18,
        right: 18,
        bottom: 22,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF176BC7),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Wednesday, June 11, 2026',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFFDCEBFF),
            ),
          ),

          SizedBox(height: 6),

          Text(
            'My Classes',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              height: 1.05,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 20),

          AttendanceSummaryCard(),
        ],
      ),
    );
  }
}