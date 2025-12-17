import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String type; // e.g. "QUIZ", "Tugas", "Pertemuan 3"
  final String title;
  final String deadline;
  final bool isCompleted;
  final IconData icon; // Defaults based on type if needed, but passed for flexibility
  final VoidCallback? onTap;

  const TaskCard({
    super.key,
    required this.type,
    required this.title,
    required this.deadline,
    this.isCompleted = false,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
             BoxShadow(
               color: Colors.black.withOpacity(0.05),
               blurRadius: 8,
               offset: const Offset(0, 2),
             )
          ],
        ),
        child: Column(
          children: [
            // Header Row: Badge & Check
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF64B5F6), // Light Blue
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    type,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: isCompleted ? const Color(0xFF00E676) : Colors.grey.shade300,
                  size: 20,
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // Content Row: Icon & Title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 32, color: Colors.black87),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            Divider(color: Colors.grey.shade200),
            const SizedBox(height: 8),
            
            // Footer: Deadline
            Row(
              children: [
                const Text(
                  "Tenggat Waktu : ",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
                Text(
                  deadline,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
