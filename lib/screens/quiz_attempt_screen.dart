import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class QuizAttemptScreen extends StatefulWidget {
  const QuizAttemptScreen({super.key});

  @override
  State<QuizAttemptScreen> createState() => _QuizAttemptScreenState();
}

class _QuizAttemptScreenState extends State<QuizAttemptScreen> {
  int _currentQuestionIndex = 0;
  final Map<int, int> _selectedAnswers = {}; // Map<QuestionIndex, OptionIndex>

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "Radio button dapat digunakan untuk menentukan ?",
      "options": ["Jenis Kelamin", "Alamat", "Hobby", "Riwayat Pendidikan", "Umur"],
    },
    {
      "question": "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
      "options": ["Intergrasi", "Standarisasi", "Konsistensi", "Koefensi", "Koreksi"],
    },
    // Add more placeholders to reach 15 if needed, or just loop/limit logic
    for (int i = 3; i <= 15; i++)
       {
      "question": "Pertanyaan placeholder nomor $i",
      "options": ["Pilihan A", "Pilihan B", "Pilihan C", "Pilihan D", "Pilihan E"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFC62828), // Deep Red
        leading: const BackButton(color: Colors.white),
        title: const Text(
          "Quiz Review 1",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: const [
                Icon(Icons.timer_outlined, color: Colors.white),
                SizedBox(width: 8),
                Text("15 : 00", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question Navigation Circles
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(15, (index) {
                  final int questionNum = index + 1;
                  final bool isAnswered = _selectedAnswers.containsKey(index);
                  final bool isCurrent = index == _currentQuestionIndex;
                  
                  Color bgColor;
                  Color borderColor;
                  Color textColor;

                  if (isAnswered && !isCurrent) {
                    bgColor = Colors.green; // Answered
                    borderColor = Colors.green;
                    textColor = Colors.white;
                  } else if (isCurrent) {
                    bgColor = Colors.green; // Active matches visual of being 'selected' or 'focused' - user image showed '1' green when active? Wait.
                    // Image 1: Q1 active. Circle 1 is NOT filled green? It looks white with black border? Wait let me recheck image 1.
                    // Image 1: Number 1 is white circle, black text. Numbers 2-15 white circle black text.
                    // Image 2: Q2 active. Number 1 is GREEN circle. Number 2 is white circle.
                    // Conclusion: Green = Answered/Submitted previously. Current active needs to be distinct? Or just white? 
                    // Let's assume Current is White with maybe a bold border, and Answered is Green.
                    // If Q1 is active and selected, does it turn green immediately? 
                    // Let's stick to: Green if answered.
                    if (isAnswered) {
                       bgColor = Colors.green;
                       borderColor = Colors.green;
                       textColor = Colors.white;
                    } else {
                       bgColor = Colors.white;
                       borderColor = Colors.black54; // default
                       textColor = Colors.black;
                    }
                  } else {
                    bgColor = Colors.white;
                    borderColor = Colors.black54;
                    textColor = Colors.black;
                  }

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentQuestionIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bgColor,
                        border: Border.all(color: borderColor),
                      ),
                      child: Text(
                        "$questionNum",
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Question number title
            Text(
              "Soal Nomor ${_currentQuestionIndex + 1} / 15",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            
            const SizedBox(height: 24),
            
            // Question Text
            Text(
              _questions[_currentQuestionIndex]['question'],
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
            
            const SizedBox(height: 40),
            
            // Options
            ...List.generate(
              (_questions[_currentQuestionIndex]['options'] as List).length,
              (index) {
                final String optionText = (_questions[_currentQuestionIndex]['options'] as List)[index];
                final String label = String.fromCharCode(65 + index); // A, B, C...
                final bool isSelected = _selectedAnswers[_currentQuestionIndex] == index;
                
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedAnswers[_currentQuestionIndex] = index;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFEF5350) : const Color(0xFFF5F5F5), // Red if selected, Grey if not
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: isSelected 
                        ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))]
                        : [],
                    ),
                    child: Row(
                      children: [
                        Text("$label. ", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black87
                        )),
                        Expanded(
                          child: Text(
                            optionText,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),

            const SizedBox(height: 40),
            
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous Button
                if (_currentQuestionIndex > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentQuestionIndex--;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text("Soal Sebelum nya."),
                  )
                else
                   const SizedBox(), // Spacer
                   
                // Next / Finish Button
                if (_currentQuestionIndex < _questions.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentQuestionIndex++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text("Soal Selanjut nya."),
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Review Answer
                      Navigator.pushNamed(context, '/review_answer');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00E676), // Bright Green
                      foregroundColor: Colors.black, // Text color appears black in screenshot
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: const Text("Selesai.", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
