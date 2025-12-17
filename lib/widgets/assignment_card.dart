import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/text_styles.dart';

class AssignmentCard extends StatelessWidget {
  final String title;
  final String description;
  final String deadline;
  final bool isCompleted;
  final bool isQuiz; // true for Quiz icon, false for Assignment icon
  final VoidCallback? onTap;

  const AssignmentCard({
    super.key,
    required this.title,
    required this.description,
    required this.deadline,
    this.isCompleted = false,
    this.isQuiz = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Header with Title and Status
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
               border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.heading3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: isCompleted ? AppColors.successGreen : AppColors.lightGrey,
                  size: 24,
                ),
              ],
            ),
          ),
          // Body with Icon and Description
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  isQuiz ? Icons.quiz_outlined : Icons.assignment_outlined,
                  size: 40,
                  color: AppColors.textBlack,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: AppTextStyles.bodyText,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        deadline,
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}
