import 'package:flutter/material.dart';

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
                    "Pengantar User Interface Design",
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
                // Tab 1: Lampiran Materi (Placeholder)
                const Center(child: Text("Materi content...")),

                // Tab 2: Tugas dan Kuis (Empty State)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Illustration
                    // Since we don't have the girl image, we'll likely use a placeholder or check asset again?
                    // I checked assets previously and only profile_pic exists.
                    // I'll use a large icon or network image if connection allows, but safer to use Icon + Color blobbiness to mimic?
                    // Or standard empty illustration pattern.
                    // The user wants "like in the image with detail".
                    // I will try to use a standard illustration style icon.
                    Container(
                      width: 200,
                      height: 200,
                      // Placeholder for illustration
                      child: Stack(
                         alignment: Alignment.center,
                         children: [
                            Icon(Icons.person_outline, size: 100, color: Colors.orange), // Fallback
                            // Ideally we'd use an asset. I'll just use a relevant Icon.
                         ]
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Tidak Ada Tugas Dan Kuis Hari Ini",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
