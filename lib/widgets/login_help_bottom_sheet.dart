import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class LoginHelpBottomSheet extends StatefulWidget {
  const LoginHelpBottomSheet({super.key});

  @override
  State<LoginHelpBottomSheet> createState() => _LoginHelpBottomSheetState();
}

class _LoginHelpBottomSheetState extends State<LoginHelpBottomSheet> {
  bool isEnglish = true; // Default to English based on latest screenshot

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
       child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Language Toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               _buildLanguageOption("ID", "assets/images/flag_id.png", !isEnglish),
               const SizedBox(width: 40),
               _buildLanguageOption("EN", "assets/images/flag_en.png", isEnglish),
            ],
          ),
          
          const SizedBox(height: 32),
          
          // Content
          Text(
            isEnglish 
                ? "Access restricted only for Lecturer and Student of Telkom University."
                : "Akses hanya untuk Dosen dan Mahasiswa Telkom University.",
            style: const TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
          ),
          const SizedBox(height: 16),
          Text(
            isEnglish
                ? "Login only using your Microsoft Office 365 Account by following these format :"
                : "Login menggunakan Akun Microsoft Office 365 dengan mengikuti petunjuk berikut :",
             style: const TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
          ),
          const SizedBox(height: 16),
          Text(
            isEnglish
                ? "Username (iGracias Account) followed with \"@365.telkomuniversity.ac.id\"\nPassword (SSO / iGracias Account) on Password Field."
                : "Username (Akun iGracias) ditambahkan \"@365.telkomuniversity.ac.id\"\nPassword (Akun iGracias) pada kolom Password.",
             style: const TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
          ),
          const SizedBox(height: 16),
          Text(
            isEnglish
                ? "Failure upon Authentication could be possibly you have not yet change your password into \"Strong Password\". Make sure to change your Password only in iGracias."
                : "Kegagalan yang terjadi pada Autentikasi disebabkan oleh Anda belum mengubah Password Anda menjadi \"Strong Password\". Pastikan Anda telah melakukan perubahan Password di iGracias.",
             style: const TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
          ),
          const SizedBox(height: 16),
          Text(
            isEnglish
                ? "For further Information, please contact CeLOE Service Helpdesk :"
                : "Informasi lebih lanjut dapat menghubungi Layanan CeLOE Helpdesk di :",
             style: const TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
          ),
           const SizedBox(height: 16),
           const Text(
            "mail : infoceloe@telkomuniversity.ac.id\nwhatsapp : +62 821-1666-3563",
            style: TextStyle(fontSize: 13, height: 1.5, fontWeight: FontWeight.w500, color: Colors.black87),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String code, String assetPath, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEnglish = (code == "EN");
        });
      },
      child: Column(
        children: [
          // Flag Placeholder (Color block if asset missing)
          Container(
            width: 32,
            height: 22,
            decoration: BoxDecoration(
              color: code == "ID" ? Colors.red : Colors.blue, // Placeholder colors
              border: Border.all(color: Colors.grey.shade300),
            ),
             alignment: Alignment.center,
             child: Text(code, style: const TextStyle(color: Colors.white, fontSize: 8)),
          ),
          const SizedBox(height: 8),
          Text(
            code,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
           const SizedBox(height: 4),
           if (isSelected)
             Container(
               width: 20,
               height: 2,
               color: Colors.black,
             )
        ],
      ),
    );
  }
}
