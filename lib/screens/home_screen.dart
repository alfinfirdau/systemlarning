import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/text_styles.dart';
import 'course_detail_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Header
            Container(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
              decoration: const BoxDecoration(
                color: Color(0xFFC62828), // Deep Red
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: const [
                       Text("Hallo,", style: TextStyle(color: Colors.white, fontSize: 14)),
                       SizedBox(height: 4),
                       Text(
                         "DANDY CANDRA PRATAMA", 
                         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)
                       ),
                     ],
                   ),
                   GestureDetector(
                     onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                     },
                     child: Container(
                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                       decoration: BoxDecoration(
                         color: Colors.white.withOpacity(0.2),
                         borderRadius: BorderRadius.circular(20),
                         border: Border.all(color: Colors.white.withOpacity(0.5)),
                       ),
                       child: Row(
                         children: const [
                            Text("MAHASISWA", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                            SizedBox(width: 8),
                            Icon(Icons.person_outline, color: Colors.white, size: 16),
                         ],
                       ),
                     ),
                   )
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Tugas Yang Akan Datang
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Tugas Yang Akan Datang", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB71C1C), // Darker Red Card
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                         BoxShadow(
                           color: Colors.red.withOpacity(0.3),
                           blurRadius: 10,
                           offset: const Offset(0, 4),
                         )
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Tugas 01 - UID Android Mobile Game",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                        const SizedBox(height: 20),
                        
                        Center(
                          child: Column(
                            children: const [
                              Text("Waktu Pengumpulan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text("Jumat 26 Februari, 23:59 WIB", style: TextStyle(color: Colors.white70, fontSize: 12)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
             // Pengumuman
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const Text("Pengumuman Terakhir", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                       TextButton(onPressed: (){}, child: const Text("Lihat Semua", style: TextStyle(fontSize: 12))),
                     ],
                   ),
                   const Align(
                     alignment: Alignment.centerLeft,
                     child: Text("Maintenance Pra UAS Semester Genap 2020/2021", style: TextStyle(fontSize: 12, color: Colors.black87)),
                   ),
                   const SizedBox(height: 12),
                   Container(
                     height: 140,
                     width: double.infinity,
                     decoration: BoxDecoration(
                       color: Colors.blue.shade50, // Placeholder color
                       borderRadius: BorderRadius.circular(12),
                       image: const DecorationImage(
                         image: NetworkImage("https://via.placeholder.com/600x300"), // Placeholder
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Progres Kelas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Text("Progres Kelas", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  _buildCourseProgressItem(
                    context,
                    title: "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
                    code: "D4SM-42-03 [ADY]",
                    progress: 0.69,
                    color: Colors.orange,
                    iconLabel: "ui UX",
                  ),
                  _buildCourseProgressItem(
                    context,
                    title: "KEWARGANEGARAAN",
                    code: "D4SM-41-GAB1 [BBO]. JUMAT 2",
                    progress: 0.65,
                    color: Colors.red,
                    iconLabel: "PKn", // Placeholder logic
                  ),
                   _buildCourseProgressItem(
                    context,
                    title: "SISTEM OPERASI",
                    code: "D4SM-44-02 [DDS]",
                    progress: 0.90,
                    color: Colors.blue,
                    iconLabel: "OS",
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseProgressItem(BuildContext context, {
    required String title,
    required String code,
    required double progress,
    required Color color,
    required String iconLabel,
  }) {
    return GestureDetector(
      onTap: () {
         // Link specific course to Detail
         Navigator.push(context, MaterialPageRoute(builder: (c) => const CourseDetailScreen()));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          // Simple shadow
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(iconLabel, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
              // Use real images if available
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("2021/2", style: TextStyle(fontSize: 10, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(
                    title, 
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(code, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                  const SizedBox(height: 12),
                  // Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFC62828)),
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
