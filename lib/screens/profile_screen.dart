import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Height for the red background
    const double headerHeight = 350;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFFC62828),
        ),
        child: BottomNavigationBar(
          currentIndex: 0, // Just visual
          onTap: (index) {},
          backgroundColor: const Color(0xFFC62828),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Kelas Saya',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifikasi',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack for Header, Avatar and Floating Card
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                // Red Background
                Container(
                  height: headerHeight,
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 40, left: 16),
                  color: const Color(0xFFC62828),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        iconSize: 28,
                      ),
                    ],
                  ),
                ),
                
                // Content Information
                Positioned(
                  top: 80,
                  child: Column(
                    children: [
                      // Avatar
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red.shade900, // Darker red backing
                          image: const DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/150"), // Replace with user image
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(color: Colors.white, width: 0), // No visible border in image but clean edge
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "DANDY CANDRA PRATAMA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Floating Card
                Positioned(
                  top: 280, // Adjust overlap
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 80, // Height for tabs
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTabItem("About Me", isActive: true),
                        _buildTabItem("Kelas", isActive: false),
                        _buildTabItem("Edit Profile", isActive: false),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60), // Space for floating card overlap (350 red height vs 280 pos + 80 height)
            // Actually: 280 + 80 = 360. 
            // Header is 350. Stack ends at max(350, 360).
            // We need padding for the body content below.
            
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 24.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text("Informasi User", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                   const SizedBox(height: 16),
                   _buildInfoField("Email address", "dandycandra@365.telkomuniversity.ac.id"),
                   _buildInfoField("Program Studi", "D4 Teknologi Rekayasa Multimedia"),
                   _buildInfoField("Fakultas", "FIT"),
                   
                   const SizedBox(height: 24),
                   
                   const Text("Aktivitas Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                   const SizedBox(height: 16),
                   _buildLoginInfo("First access to site", "Monday, 7 September 2020, 9:27 AM", "(288 days 12 hours)"),
                   const SizedBox(height: 16),
                   _buildLoginInfo("Last access to site", "Tuesday, 22 June 2021, 9:44 PM", "(now)"),
                   
                   const SizedBox(height: 40),
                   
                   // Logout Button
                   Align(
                     alignment: Alignment.centerRight,
                     child: ElevatedButton.icon(
                       onPressed: () {
                          // Mock Logout
                          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                       },
                       icon: const Icon(Icons.logout, color: Colors.white),
                       label: const Text("Log Out", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                       style: ElevatedButton.styleFrom(
                         backgroundColor: const Color(0xFFB71C1C),
                         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                       ),
                     ),
                   ),
                   const SizedBox(height: 20),
                 ],
               ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String label, {required bool isActive}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.black : Colors.black54,
          ),
        ),
        if (isActive) 
          Container(
            margin: const EdgeInsets.top(4),
            width: 30,
            height: 3,
            color: Colors.grey,
          )
      ],
    );
  }

  Widget _buildInfoField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.black87)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 14, color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildLoginInfo(String label, String date, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.black87)),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 14, color: Colors.black54),
            children: [
              TextSpan(text: "$date "),
              TextSpan(text: time, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
