import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';

class UploadBottomSheet extends StatelessWidget {
  const UploadBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFC62828), // Deep Red
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Upload File",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Text(
                  "Maksimum File 5MB , Maksimum Jumlah File 20",
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
                const SizedBox(height: 24),
                
                // Dotted Upload Area
                DottedBorder(
                  // borderType: BorderType.RRect, // Removed to use default Rect
                  // radius: const Radius.circular(0), // Removed
                  color: Colors.black54,
                  strokeWidth: 1,
                  dashPattern: const [6, 4],
                  child: Container(
                    width: double.infinity,
                    height: 200, // Adjusted height
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Cloud Icon
                         const Icon(
                              Icons.cloud_upload,
                              size: 80,
                              color: Color(0xFF42A5F5), // Blue color
                            ),
                        const SizedBox(height: 16),
                        const Text(
                          "File yang akan di upload akan tampil di sini",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Buttons
                SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Pilih File"),
                  ),
                ),
                
                 const SizedBox(height: 16),

                SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade100, // Simpan disabled/secondary style
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Simpan"),
                  ),
                ),
                
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
