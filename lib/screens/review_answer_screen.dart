import 'package:flutter/material.dart';

class ReviewAnswerScreen extends StatelessWidget {
  const ReviewAnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFC62828), // Deep Red
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Review Jawaban",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false, // No back button shown in design? Or maybe standard back. Design shows no back button, usually typical for a result screen (prevent going back to quiz).
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Info Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildInfoRow("Di Mulai Pada", "Kamis 25 Februari 2021 10:25"),
                  const SizedBox(height: 8),
                  _buildInfoRow("Status", "Selesai"),
                  const SizedBox(height: 8),
                  _buildInfoRow("Selesai Pada", "Kamis 25 Februari 2021 10:40"),
                  const SizedBox(height: 8),
                  _buildInfoRow("Waktu Penyelesaian", "13 Menit 22 Detik"),
                  const SizedBox(height: 8),
                  _buildInfoRow("Nilai", "0 / 100"),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Questions List
            _buildQuestionItem(
              number: 1,
              question: "Radio button dapat digunakan untuk menentukan ?",
              answer: "A. Jenis Kelamin",
            ),
             _buildQuestionItem(
              number: 2,
              question: "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
              answer: "B. Konsistensi",
            ),
             _buildQuestionItem(
              number: 3,
              question: "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
              answer: "C. Konsistensi",
            ),
             _buildQuestionItem(
              number: 4,
              question: "Radio button dapat digunakan untuk menentukan ?",
              answer: "A. Jenis Kelamin",
            ),
             _buildQuestionItem(
              number: 5,
              question: "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
              answer: "C. Konsistensi",
            ),
             _buildQuestionItem(
              number: 6,
              question: "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
              answer: "C. Konsistensi",
            ),
             _buildQuestionItem(
              number: 7,
              question: "Radio button dapat digunakan untuk menentukan ?",
              answer: "A. Jenis Kelamin",
            ),

            const SizedBox(height: 40),

            // Button
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                   // Navigate back to course detail or home? Design says "Kirim Jawaban" which implies submission. 
                   // But status says "Selesai". This might be "Close" or "Finish Review".
                   // Let's pop to specific route or just pop.
                   Navigator.popUntil(context, ModalRoute.withName('/course_detail_screen')); // Or just pop a few times
                   // For safety just pop for now
                   Navigator.of(context).pop(); 
                   Navigator.of(context).pop(); 
                   Navigator.of(context).pop(); // Back to Course Detail
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00E676), // Bright Green
                  foregroundColor: Colors.black, // Text Black?
                  // Wait, image shows Update: "Kirim Jawaban" text is BLACK, Background Green.
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Kirim Jawaban", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
             const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140, 
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
        ),
        Expanded(
          child: Text(value, style: const TextStyle(fontSize: 13, color: Colors.black87)),
        ),
      ],
    );
  }

  Widget _buildQuestionItem({required int number, required String question, required String answer}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(
                 width: 80,
                 child: Text("Pertanyaan $number", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
               ),
               Expanded(
                 child: Container(
                   padding: const EdgeInsets.all(12),
                   color: const Color(0xFFE0E0E0), // Grey background for question
                   child: Text(question, style: const TextStyle(fontSize: 13, height: 1.4)),
                 ),
               ),
             ],
           ),
           const SizedBox(height: 12),
           Row(
             children: [
               const SizedBox(width: 80), // Indent to match question text start
               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text("Jawaban Tersimpan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                     const SizedBox(height: 4),
                     Text(answer, style: const TextStyle(fontSize: 13)),
                   ],
                 ),
               ),
               GestureDetector(
                 onTap: (){},
                 child: const Text("Lihat Soal", style: TextStyle(color: Color(0xFF1565C0), fontSize: 12, fontWeight: FontWeight.bold)),
               ),
             ],
           ),
        ],
      ),
    );
  }
}
