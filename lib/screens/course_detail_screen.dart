import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../widgets/task_card.dart';
import '../widgets/material_item.dart';
import '../widgets/topic_detail_bottom_sheet.dart';
import 'video_player_screen.dart';

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
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1); // Default to Tugas tab as per screenshot context
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light background
      appBar: AppBar(
        backgroundColor: const Color(0xFFC62828), // Deep Red
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          "DESAIN ANTARMUKA & PENGALAMAN\nPENGGUNA D4SM-42-03 [ADY]",
          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          maxLines: 2,
        ),
        toolbarHeight: 80, // Taller AppBar for 2-line title
      ),
      body: Column(
        children: [
          // Tab Bar Container
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              indicatorWeight: 3,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: "Materi"),
                Tab(text: "Tugas Dan Kuis"),
              ],
            ),
          ),

          // Tab View
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab 1: Materi (Reused existing content style)
                ListView(
                   padding: const EdgeInsets.all(20),
                   children: [
                     MaterialItem(
                       title: "Pengantar User Interface Design",
                       icon: Icons.book,
                       isCompleted: false, // Not completed yet
                       onTap: () {
                         showModalBottomSheet(
                           context: context,
                           isScrollControlled: true,
                           shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                           ),
                           builder: (context) => const TopicDetailBottomSheet(),
                         );
                       },
                     ),
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
                       title: "Video - User Interface Design For Beginner",
                       icon: Icons.play_circle_outline,
                       isCompleted: false,
                       onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const VideoPlayerScreen()),
                        );
                       },
                     ),
                   ],
                ),

                // Tab 2: Tugas Dan Kuis (New Task Cards)
                ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    TaskCard(
                      type: "QUIZ",
                      title: "Quiz Review 01",
                      deadline: "26 Februari 2021 23:59 WIB",
                      icon: Icons.quiz_outlined,
                      isCompleted: true,
                      onTap: () {
                        Navigator.pushNamed(context, '/quiz_review');
                      },
                    ),
                    TaskCard(
                      type: "Tugas",
                      title: "Tugas 01 - UID Android Mobile Game",
                      deadline: "26 Februari 2021 23:59 WIB",
                      icon: Icons.assignment_outlined,
                      isCompleted: false, // Grey check in image
                    ),
                    TaskCard(
                      type: "Pertemuan 3",
                      title: "Kuis - Assessment 2",
                      deadline: "26 Februari 2021 23:59 WIB",
                      icon: Icons.quiz_outlined,
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

