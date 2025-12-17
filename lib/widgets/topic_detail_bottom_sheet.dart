import 'package:flutter/material.dart';
import 'assignment_card.dart';
import 'material_item.dart';

class TopicDetailBottomSheet extends StatefulWidget {
  const TopicDetailBottomSheet({super.key});

  @override
  State<TopicDetailBottomSheet> createState() => _TopicDetailBottomSheetState();
}

class _TopicDetailBottomSheetState extends State<TopicDetailBottomSheet> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1); // Default to "Tugas dan Kuis" as per image
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85, // Tall bottom sheet
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Drag Handle
          const SizedBox(height: 12),
          Container(
            width: 80, 
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
          const SizedBox(height: 24),

          // Header Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Konsep User Interface Design",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Deskripsi",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  "Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetap pada matakuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasukki materi mengenai User Experience",
                  style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),

          // Tab Bar
          Container(
            color: const Color(0xFFF5F5F5), // Light grey background for tab bar container
            width: double.infinity,
            child: Center( // Center the tabs
              child: TabBar(
                controller: _tabController,
                isScrollable: true, // Auto width
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.black,
                indicatorWeight: 3,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: "Lampiran Materi"),
                  Tab(text: "Tugas dan Kuis"),
                ],
              ),
            ),
          ),

          // Tab View
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab 1: Lampiran Materi
                ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    MaterialItem(
                      title: "Slide Presentasi (PDF)",
                      icon: Icons.picture_as_pdf,
                      isCompleted: true,
                      onTap: () {
                         Navigator.pushNamed(context, '/material_slide');
                      },
                    ),
                  ],
                ),

                // Tab 2: Tugas dan Kuis (Populated)
                ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    AssignmentCard(
                      title: "Quiz Review 01",
                      description: "Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis. Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.",
                      deadline: "Kerjakan sebelum hari Jum'at, 26 Februari 2021 jam 23:59 WIB.",
                      isQuiz: true,
                      isCompleted: true, // Green check
                    ),
                    AssignmentCard(
                      title: "Tugas 01 - UID Android Mobile Game",
                      description: "1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.\n2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi ...........",
                      deadline: "", // No specific deadline text visible in card bottom, maybe inside description or omitted
                      isQuiz: false, // Document icon
                      isCompleted: false, // Grey check
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
