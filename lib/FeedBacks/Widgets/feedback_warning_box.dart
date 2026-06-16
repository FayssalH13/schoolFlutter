import 'package:flutter/material.dart';

class FeedbackWarningBox extends StatelessWidget {
  const FeedbackWarningBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 13, 16, 13),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFAEA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFFD164),
          width: 1,
        ),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1),
            child: Icon(
              Icons.info_outline_rounded,
              color: Color(0xFFF5A623),
              size: 17,
            ),
          ),

          SizedBox(width: 10),

          Expanded(
            child: Text(
              'You can only add feedback for classes where attendance has been taken. Complete attendance first to unlock the remaining classes.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 11,
                height: 1.45,
                fontWeight: FontWeight.w700,
                color: Color(0xFFD88A00),
              ),
            ),
          ),
        ],
      ),
    );
  }
}