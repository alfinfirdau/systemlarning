import 'package:flutter/material.dart';

class AnnouncementDetailScreen extends StatelessWidget {
  const AnnouncementDetailScreen({super.key});

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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: const Color(0xFFC62828)),
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
             if (index == 0) Navigator.popUntil(context, ModalRoute.withName('/home'));
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Maintenance Pra UAS Semester Genap 2020/2021",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 16, color: Colors.white),
                ),
                const SizedBox(width: 8),
                const Text(
                  "By Admin Celoe - Rabu, 2 Juni 2021, 10:45",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Banner Image
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                 image: const DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/600x300"), // Placeholder for banner
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                "Maintenance LMS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Diinformasikan kepada seluruh pengguna LMS, kami dari tim CeLOE akan melakukan maintenance pada tanggal 12 Juni 2021, untuk meningkatkan layanan server dalam menghadapi ujian akhir semester (UAS).",
              style: TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 12),
            const Text(
              "Dengan adanya kegiatan maintenance tersebut maka situs LMS (lms.telkomuniversity.ac.id) tidak dapat diakses mulai pukul 00.00 s/d 06.00 WIB.",
              style: TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
               textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 12),
            const Text(
              "Demikian informasi ini kami sampaikan, mohon maaf atas ketidaknyamanannya.",
              style: TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
               textAlign: TextAlign.justify,
            ),
             const SizedBox(height: 24),
            const Text(
              "Hormat Kami,\nCeLOE Telkom University",
              style: TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
            ),
             const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
