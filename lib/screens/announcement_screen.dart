import 'package:flutter/material.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Pengumuman",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      // Visual-only bottom nav to match the design requirement
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: const Color(0xFFC62828)),
        child: BottomNavigationBar(
          currentIndex: 0, // Mocking Home as selected or none
          onTap: (index) {
             // Optional: Handle navigation if needed, or just pop
             if (index == 0) Navigator.pop(context); // Go back home
          },
          backgroundColor: const Color(0xFFC62828),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Kelas Saya'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifikasi'),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          _buildAnnouncementItem(
            context,
            title: "Maintenance Pra UAS Semester Genap 2020/2021",
            subtitle: "By Admin Celoe - Rabu, 2 Juni 2021, 10:45",
          ),
          _buildAnnouncementItem(
            context,
            title: "Pengumuman Maintance",
            subtitle: "By Admin Celoe - Senin, 11 Januari 2021, 7:52",
          ),
          _buildAnnouncementItem(
            context,
            title: "Maintenance Pra UAS Semeter Ganjil 2020/2021",
            subtitle: "By Admin Celoe - Minggu, 10 Januari 2021, 9:30",
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementItem(
    BuildContext context, {
    required String title,
    required String subtitle,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/announcement_detail');
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Megaphone Icon
            const Icon(Icons.campaign, size: 32, color: Colors.black),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
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
