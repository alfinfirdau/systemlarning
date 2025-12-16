import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/text_styles.dart';
import '../widgets/assignment_card.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Konsep User Interface Design",
          style: AppTextStyles.heading2,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Description Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Deskripsi", style: AppTextStyles.heading3),
                const SizedBox(height: 8),
                Text(
                  "Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna...",
                  style: AppTextStyles.bodyText.copyWith(color: AppColors.textGrey),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          
          // Custom Tab Bar
          Container(
             color: AppColors.lightGrey,
             child: TabBar(
              controller: _tabController,
              labelColor: AppColors.textBlack,
              unselectedLabelColor: AppColors.textGrey,
              indicatorColor: AppColors.textBlack,
              indicatorWeight: 3,
              tabs: const [
                Tab(text: "Lampiran Materi"),
                Tab(text: "Tugas dan Kuis"),
              ],
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
                     // Empty state / illustration matching screenshot 3
                     Center(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           const SizedBox(height: 40),
                           const Icon(Icons.person_off_rounded, size: 100, color: Colors.grey), // Placeholder for illustration
                           const SizedBox(height: 20),
                           Text("Tidak Ada Tugas Dan Kuis Hari Ini", style: AppTextStyles.heading2),
                           // Note: Screenshot actually says this for empty assignment state maybe? 
                           // Or "Materi" might be just text or a list of PDF. 
                           // I will leave it simple.
                         ],
                       ),
                     )
                   ],
                ),

                // Tab 2: Tugas dan Kuis
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: const [
                    AssignmentCard(
                      title: "Quiz Review 01",
                      description: "Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis.",
                      deadline: "Kerjakan sebelum hari Jum'at, 26 Februari 2021 jam 23:59 WIB.",
                      isQuiz: true,
                      isCompleted: true,
                    ),
                    AssignmentCard(
                      title: "Tugas 01 - UID Android Mobile Game",
                      description: "1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS...",
                      deadline: "Desain yang dibuat harus melingkupi seluruh tampilan...",
                      isQuiz: false,
                      isCompleted: true, // Grey checkmark in screenshot implies completed or past due? Assuming completed for now.
                    ),
                     AssignmentCard(
                      title: "Kuis - Assessment 2",
                      description: "Kerjakan assessment 2 berikut.",
                      deadline: "Tenggat Waktu: 26 Februari 2021 23:59 WIB",
                      isQuiz: true,
                      isCompleted: true,
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
