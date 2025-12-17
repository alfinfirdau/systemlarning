import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/text_styles.dart';
import '../widgets/assignment_card.dart';
import '../widgets/material_item.dart';

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
        title: const Text(
          "", // Empty title in AppBar as per design it seems local header
          style: TextStyle(color: Colors.black), 
        ),
        actions: [
             // Add a 3-dot menu or similar if needed?
        ],
      ),
      body: Column(
        children: [
          // Content Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Center(
                   child: Text(
                    "Konsep User Interface Design",
                    style: AppTextStyles.heading2.copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                                   ),
                 ),
                const SizedBox(height: 24),
                
                Text("Deskripsi", style: AppTextStyles.heading3),
                const SizedBox(height: 8),
                Text(
                  "Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna. Lalu dipelajari juga poin-poin penting pada interaction design seperti visibility, feedback, limitation, consistency dan affordance. Dan terakhir materi conceptual dan perceptual design interaction akan memberikan gambaran bagaimana bentuk dari Interaction.",
                  style: AppTextStyles.bodyText.copyWith(color: AppColors.textGrey, height: 1.5),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),

          // Custom Tab Bar
          Container(
             color: AppColors.lightGrey,
             child: TabBar(
              controller: _tabController,
              labelColor: AppColors.textBlack,
              unselectedLabelColor: AppColors.textGrey,
              indicatorColor: AppColors.textBlack,
              indicatorWeight: 3,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: "Lampiran Materi"),
                Tab(text: "Tugas dan Kuis"),
              ],
            ),
          ),

          // Tab View
          Expanded(
            child: Container(
              color: const Color(0xFFF9F9F9), // Light background for list
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Tab 1: Lampiran Materi
                  ListView(
                     padding: const EdgeInsets.all(20),
                     children: const [
                       MaterialItem(
                         title: "Zoom Meeting Syncronous",
                         icon: Icons.link,
                         isCompleted: true,
                       ),
                       MaterialItem(
                         title: "Elemen-elemen Antarmuka Pengguna",
                         icon: Icons.description_outlined,
                         isCompleted: true,
                       ),
                       MaterialItem(
                         title: "UID Guidelines and Principles",
                         icon: Icons.description_outlined,
                         isCompleted: true,
                       ),
                       MaterialItem(
                         title: "User Profile",
                         icon: Icons.description_outlined,
                         isCompleted: true,
                       ),
                       MaterialItem(
                         title: "Principles of User Interface DesignURL",
                         icon: Icons.link,
                         isCompleted: true,
                       ),
                     ],
                  ),
  
                  // Tab 2: Tugas dan Kuis
                  ListView(
                    padding: const EdgeInsets.all(16),
                    children: const [
                      AssignmentCard(
                        title: "Quiz Review 01",
                        description: "Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis.",
                        deadline: "Deadline: 26 Feb 2021",
                        isQuiz: true,
                        isCompleted: true,
                      ),
                      AssignmentCard(
                        title: "Tugas 01",
                        description: "Buatlah desain tampilan aplikasi.",
                        deadline: "Deadline: 28 Feb 2021",
                        isQuiz: false,
                        isCompleted: true, 
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

