import 'package:flutter/material.dart';

class QuizReviewScreen extends StatelessWidget {
  const QuizReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFC62828), // Deep Red Header
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Quiz Review 1",
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Instructions
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis.\nJangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.",
                    style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Kerjakan sebelum hari Jum'at, 26 Februari 2021 jam 23:59 WIB.",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),

            // Info Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  Text(
                    "Kuis Akan di tutup pada Jumat, 26 February 2021, 11:59 PM",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Batas Waktu: 15 menit",
                     style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Metode Penilaian: Nilai Tertinggi",
                     style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Attempts Table Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text("Percobaan Yang Sudah Di Lakukan", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 8),
            
            // Table Header Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              color: const Color(0xFFEF5350), // Light Red
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Status", style: TextStyle(color: Colors.white, fontSize: 12)),
                  Text("Nilai / 100.00", style: TextStyle(color: Colors.white, fontSize: 12)),
                  Text("Tinjau Kembali", style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
            
            // Table Row
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              color: const Color(0xFFF9F9F9),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: const [
                       Text("Selesai", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                       SizedBox(height: 4),
                       Text("Dikirim Pada Kamis, 25 Februari 2021, 10:40", style: TextStyle(fontSize: 11, color: Colors.black87)),
                     ],
                   ),
                   const Text("85,0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                   const Text("Lihat", style: TextStyle(color: Color(0xFF1565C0), fontSize: 13, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            const Text(
              "Nilai Akhir Anda Unutuk Kuis Ini Adalah 85.0 / 100.00",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            
            const SizedBox(height: 40),
            
            // Buttons
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF5F5F5),
                        foregroundColor: Colors.black,
                        elevation: 0,
                         padding: const EdgeInsets.symmetric(vertical: 16),
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("Ambil Kuis"),
                    ),
                  ),
                   const SizedBox(height: 16),
                   SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF5F5F5),
                        foregroundColor: Colors.black,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("Kembali Ke Kelas"),
                    ),
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
}
