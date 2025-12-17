import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/text_styles.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryRed,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          "Video - User Interface Design For Beginner",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Player Placeholder
            Container(
              width: double.infinity,
              height: 220,
              color: Colors.black,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // You can replace this with a real Image.network if you have the URL
                  // Using specific placeholder logic to match image "UI DESIGN"
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                       Text("UI", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                       Text("DESIGN", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Icon(Icons.play_circle_fill, color: Colors.red, size: 60),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Video Lain Nya", style: AppTextStyles.heading3),
            ),
            
            const SizedBox(height: 16),
            
            Container(
              color: Colors.grey.shade50,
              child: Column(
                children: [
                   _buildVideoItem("Interaction Design", Colors.blue),
                   _buildVideoItem("Pengantar Desain Antarmuka Pengguna", Colors.white, isCustom: true),
                   _buildVideoItem("4 Teori Dasar Desain Antarmuka Pengguna", Colors.white, isCustom: true),
                   _buildVideoItem("Tutorial Dasar Figma - UI/UX Design Software", Colors.green),
                   const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoItem(String title, Color color, {bool isCustom = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.white, // Background of the item
      child: Row(
        children: [
          // Thumbnail
          Container(
            width: 120,
            height: 70,
            color: Colors.black12,
            child: isCustom 
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network('https://via.placeholder.com/120x70', fit: BoxFit.cover), // Placeholder
                    const Icon(Icons.play_arrow, color: Colors.red),
                    // Adding "Universitas Telkom" logo placeholder if needed, basically imitating the screenshot
                    const Positioned(
                      top: 4, right: 4, 
                      child: Icon(Icons.shield, color: Colors.red, size: 16)
                    )
                  ],
                )
              : Container(
                  color: color.withOpacity(0.2),
                  child: Center(
                    child: Icon(Icons.play_arrow, color: color),
                  ),
                ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
