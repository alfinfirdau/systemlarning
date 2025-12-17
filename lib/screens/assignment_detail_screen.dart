import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/text_styles.dart';
import '../widgets/upload_bottom_sheet.dart';

class AssignmentDetailScreen extends StatelessWidget {
  const AssignmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryRed,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          "Tugas 01 - UID Android Mobile Game",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInstructionItem("1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan."),
                  _buildInstructionItem("2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi dibuka sampai ditutup kembali, serta desain untuk tampilan-tampilan fungsi yang mendukung permainan seperti pop-up, alert, chat, dan lain-lain."),
                  _buildInstructionItem("3. Desain bisa dibuat menggunakan aplikasi khusus desain atau secara manual dengan tetap menjunjung kerapihan dan kejelasan setiap elemen dalam desain."),
                  _buildInstructionItem("4. Berikan identitas aplikasi game yang dibuat, seperti Nama Game, Genre, dan Platform. Serta berikan penjelasan pada setiap elemen pada desain, seperti gambar, teks, tombol, icon, dan lain-lain."),
                  _buildInstructionItem("5. File dikumpulkan dalam format .PDF dengan size maksimal 5MB."),
                  _buildInstructionItem("6. Tugas dikumpulkan paling lambat hari Jum'at, 26 Februari 2021 jam 23:59 WIB (akan tertutup otomatis) dan akan dipresentasikan pada pertemuan selanjutnya via Zoom Meeting."),
                  
                  const SizedBox(height: 32),
                  
                  // Status Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE57373), // Lighter red for header
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Status Tugas",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  
                  // Status Table
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey.withOpacity(0.3),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        _buildStatusRow("Status", "Sudah Mengirim untuk di nilai"),
                        _buildStatusRow("Status Nilai", "Belum Di nilai", isWhite: true),
                        _buildStatusRow("Batas tanggal", "Jumat, 26 Februari 2021, 23:59 WIB"),
                        _buildStatusRow("Sisa Waktu", "Tugas sudah di kirim 4 Hari 6 Jam Sebelum nya", isWhite: true),
                        _buildStatusFileRow("File Tugas", "Dandy Candra Pratama_7708170114.pdf"),
                      ],
                    ),
                  ),

                   const SizedBox(height: 100), // Bottom padding for button
                ],
              ),
            ),
          ),
          
          // Bottom Button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
               width: double.infinity,
               height: 50,
               child: ElevatedButton(
                 onPressed: () {
                   showModalBottomSheet(
                     context: context,
                     isScrollControlled: true,
                     backgroundColor: Colors.transparent,
                     builder: (context) => const UploadBottomSheet(),
                   );
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: AppColors.lightGrey,
                   elevation: 0,
                    shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(12),
                   ),
                 ),
                 child: const Text(
                   "Tambahkan Tugas",
                   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                 ),
               ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructionItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: AppTextStyles.bodyText.copyWith(height: 1.5, color: Colors.black87),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, {bool isWhite = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: isWhite ? Colors.white : Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusFileRow(String label, String fileName) {
     return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
          const Icon(Icons.file_present_rounded, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              fileName,
              style: const TextStyle(color: Colors.black87, decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
