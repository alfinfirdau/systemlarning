import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/text_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTabIndex = 0; // 0: About Me, 1: Kelas, 2: Edit Profile

  @override
  Widget build(BuildContext context) {
    const double headerHeight = 350;

    return Scaffold(
      backgroundColor: Colors.white,
      // Keep visually consistent custom bottom nav
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: const Color(0xFFC62828)),
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
          backgroundColor: const Color(0xFFC62828),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Kelas Saya'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifikasi'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Stack
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
                
                // Profile Info
                Positioned(
                  top: 80,
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red.shade900,
                          image: const DecorationImage(
                            image: AssetImage("assets/images/profile_pic.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "ALFIN FIRDAUS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Floating Tabs
                Positioned(
                  top: 280,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 80,
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
                        _buildTabItem("About Me", 0),
                        _buildTabItem("Kelas", 1),
                        _buildTabItem("Edit Profile", 2),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Body Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _buildBodyContent(),
            ),
             const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    if (_selectedTabIndex == 0) {
      return _buildAboutMe();
    } else if (_selectedTabIndex == 1) {
      return _buildKelas();
    } else {
      return _buildEditProfile();
    }
  }

  Widget _buildEditProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField("Nama Pertama"),
        const SizedBox(height: 16),
        _buildTextField("Nama Terakhir"),
        const SizedBox(height: 16),
        _buildTextField("E-mail Address"),
        const SizedBox(height: 16),
        _buildTextField("Negara"),
        const SizedBox(height: 16),
        _buildTextField("Deskripsi", maxLines: 5),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF5F5F5),
              foregroundColor: Colors.black,
              elevation: 1,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Simpan",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAboutMe() {
    return Column(
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
         // Logout
         Align(
           alignment: Alignment.centerRight,
           child: ElevatedButton.icon(
             onPressed: () {
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
      ],
    );
  }

  Widget _buildKelas() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildClassItem("BAHASA INGGRIS: BUSINESS AND SCIENTIFIC", "D4SM-41-GAB1 [ARS]", "Monday, 8 February 2021"),
        _buildClassItem("DESAIN ANTARMUKA & PENGALAMAN PENGGUNA", "D4SM-42-03 [ADY]", "Monday, 8 February 2021"),
        _buildClassItem("KEWARGANEGARAAN", "D4SM-41-GAB1 [BBO]. JUMAT 2", "Monday, 8 February 2021"),
        _buildClassItem("OLAH RAGA D3TT-44-02 [EYR]", "", "Monday, 8 February 2021"),
        _buildClassItem("PEMROGRAMAN MULTIMEDIA INTERAKTIF", "D4SM-43-04 [TPR]", "Monday, 8 February 2021"),
        _buildClassItem("PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA", "D4SM-41-GAB1 [APJ]", "Monday, 8 February 2021"),
        _buildClassItem("SISTEM OPERASI D4SM-44-02 [DDS]", "", "Monday, 8 February 2021"),
      ],
    );
  }

  Widget _buildClassItem(String title, String code, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Blue Icon
          Container(
            width: 60,
            height: 35, // Rounded pill shape
            decoration: BoxDecoration(
              color: const Color(0xFF81B4D9), // Light Blue
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, 
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87),
                ),
                if (code.isNotEmpty) ...[
                   const SizedBox(height: 4),
                   Text(code, style: const TextStyle(fontSize: 13, color: Colors.black87)),
                ],
                const SizedBox(height: 4),
                Text("Tanggal Mulai $date", style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, int index) {
    final bool isActive = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Column(
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
              margin: const EdgeInsets.only(top: 4),
              width: 30,
              height: 3,
              color: Colors.grey,
            )
          else
            const SizedBox(height: 7), // Placeholder to keep height consistent
        ],
      ),
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
