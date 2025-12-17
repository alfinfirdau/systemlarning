import 'package:flutter/material.dart';
import 'course_detail_screen.dart';

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Kelas Saya",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildClassItem(
            context,
            code: "2021/2",
            title: "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]",
            progress: 0.89,
            color: Colors.orange,
            label: "ui UX",
          ),
          _buildClassItem(
            context,
            code: "2021/2",
            title: "KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO]. JUMAT 2",
            progress: 0.86,
            color: Colors.red,
            label: "PKn", // In reality this is an image, using text/icon as placeholder or color block
            isImage: true, 
            imageAsset: "assets/images/pkn_logo.png", // We don't have this, so we will use a color block with text if needed or just color
          ),
           _buildClassItem(
            context,
            code: "2021/2",
            title: "SISTEM OPERASI\nD4SM-44-02 [DDS]",
            progress: 0.90,
            color: Colors.blueGrey,
            label: "System",
          ),
           _buildClassItem(
            context,
            code: "2021/2",
            title: "PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA\nD4SM-41-GAB1 [APJ]",
            progress: 0.90,
            color: Colors.cyan,
            label: "Mobile",
          ),
           _buildClassItem(
            context,
            code: "2021/2",
            title: "BAHASA INGGRIS: BUSINESS AND SCIENTIFIC\nD4SM-41-GAB1 [ARS]",
            progress: 0.80,
            color: Colors.grey,
            label: "English",
          ),
           _buildClassItem(
            context,
            code: "2021/2",
            title: "PEMROGRAMAN MULTIMEDIA INTERAKTIF\nD4SM-43-04 [TPR]",
            progress: 0.90,
            color: Colors.blue,
            label: "Multi",
          ),
           _buildClassItem(
            context,
            code: "2021/2",
            title: "OLAH RAGA\nD3TT-44-02 [EYR]",
            progress: 0.90,
            color: Colors.purple,
            label: "Sport",
          ),
        ],
      ),
    );
  }

  Widget _buildClassItem(BuildContext context, {
    required String code,
    required String title,
    required double progress,
    required Color color,
    required String label,
    bool isImage = false,
    String? imageAsset,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CourseDetailScreen()));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                 label.substring(0,2).toUpperCase(), // Placeholder
                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: color),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(code, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, height: 1.3),
                  ),
                  const SizedBox(height: 12),
                  // Progress
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFB71C1C)),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text("${(progress * 100).toInt()}% Selesai", style: const TextStyle(fontSize: 10, color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
