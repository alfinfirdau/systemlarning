import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'), // Placeholder user image
              radius: 20,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello, Mahasiswa!", style: AppTextStyles.heading3.copyWith(fontSize: 16)),
                const Text("S1 Teknik Informatika", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: AppColors.textBlack),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_outlined, color: AppColors.textBlack),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner / Announcement
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primaryRed,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryRed.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pengumuman Akademik",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Jadwal Pengisian KRS Semester Ganjil 2024/2025 telah dibuka.",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primaryRed,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      minimumSize: const Size(100, 36),
                    ),
                    child: const Text("Lihat Detail"),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Categories / Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard(Icons.book, "6", "Kelas"),
                _buildStatCard(Icons.task, "12", "Tugas"),
                _buildStatCard(Icons.quiz, "3", "Kuis"),
                _buildStatCard(Icons.star, "3.55", "IPK"),
              ],
            ),

            const SizedBox(height: 24),

            // Course List Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Kelas Saya", style: AppTextStyles.heading2),
                TextButton(onPressed: () {}, child: const Text("Lihat Semua")),
              ],
            ),
            
            const SizedBox(height: 10),

            // Course Cards
            _buildCourseCard(
              title: "Konsep User Interface Design",
              code: "CSH3L3",
              lecturer: "Dodi Wisnu Wardana",
              progress: 0.75,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 16),
            _buildCourseCard(
              title: "Pemrograman Berorientasi Objek",
              code: "CSH2A3",
              lecturer: "Rina Puji Astuti",
              progress: 0.4,
              color: Colors.orangeAccent,
            ),
            const SizedBox(height: 16),
            _buildCourseCard(
              title: "Algoritma dan Struktur Data",
              code: "CSH1B4",
              lecturer: "Budi Santoso",
              progress: 0.9,
              color: Colors.purpleAccent,
            ),
            
             // Bottom spacer
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Icon(icon, color: AppColors.primaryRed),
        ),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String code,
    required String lecturer,
    required double progress,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.class_, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text("$code • $lecturer", style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.shade100,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${(progress * 100).toInt()}% Completed",
                    style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
