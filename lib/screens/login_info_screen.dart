import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/text_styles.dart';

class LoginInfoScreen extends StatelessWidget {
  const LoginInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        // Logo in AppBar or just Title? Let's use the Logo Text
        title: const Text(
          "ceLoe", 
          style: TextStyle(
            color: AppColors.primaryRed,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
          ),
        ),
        actions: [
          Row(
            children: [
              _LanguageButton(label: 'ID', isSelected: true),
              const SizedBox(width: 8),
              _LanguageButton(label: 'EN', isSelected: false),
              const SizedBox(width: 16),
            ],
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // Hero Section / Illustration could go here
              Center(
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                   child: const Icon(Icons.school_rounded, size: 64, color: AppColors.primaryRed),
                ),
              ),
              const SizedBox(height: 32),
              
              const Text(
                "Welcome to CeLOE LMS",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textBlack,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Access restricted to Lecturers and Students of Telkom University.",
                style: AppTextStyles.bodyText.copyWith(color: AppColors.textGrey, height: 1.5),
              ),
              
              const SizedBox(height: 32),
              
              const _InfoSection(
                title: "Login Instructions",
                content: "Use your Microsoft Office 365 Account:\nUsername: iGracias Account followed by \"@365.telkomuniversity.ac.id\"\nPassword: SSO / iGracias Account Password.",
                icon: Icons.login_rounded,
              ),

              const SizedBox(height: 20),

              const _InfoSection(
                title: "Troubleshooting",
                content: "Authentication failure? Ensure you have changed your password to a \"Strong Password\" in iGracias.",
                icon: Icons.lock_reset_rounded,
              ),

              const SizedBox(height: 20),

              const _InfoSection(
                title: "Helpdesk",
                content: "Email: infoceloe@telkomuniversity.ac.id\nWhatsApp: +62 821-1666-3563",
                icon: Icons.support_agent_rounded,
              ),

              const SizedBox(height: 40),
              
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                     Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    "Login with Office 365", 
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const _InfoSection({
    required this.title,
    required this.content,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primaryRed.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primaryRed, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.textBlack,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: AppTextStyles.bodyText.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _LanguageButton({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // Handle language switch
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryRed : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textGrey,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
