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
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _LanguageButton(label: 'ID', isSelected: true),
            const SizedBox(width: 20),
            _LanguageButton(label: 'EN', isSelected: false),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Access restricted only for Lecturer and Student of Telkom University",
              style: AppTextStyles.bodyText,
            ),
            const SizedBox(height: 20),
            Text(
              "Login only using your Microsoft Office 365 Account by following these format :",
              style: AppTextStyles.bodyText,
            ),
            const SizedBox(height: 20),
            Text(
              "Username (iGracias Account) followed with \"@365.telkomuniversity.ac.id\"\nPassword (SSO / iGracias Account) on Password Field.",
              style: AppTextStyles.bodyText,
            ),
            const SizedBox(height: 20),
            Text(
              "Failure upon Authentication could be possibly you have not yet change your password into \"Strong Password\".\nMake sure to change your Password only in iGracias.",
              style: AppTextStyles.bodyText,
            ),
            const SizedBox(height: 30),
            Text(
              "For further Information, please contact CeLOE Service Helpdesk :",
              style: AppTextStyles.bodyText,
            ),
            const SizedBox(height: 20),
            Text(
              "mail : infoceloe@telkomuniversity.ac.id\nwhatsapp : +62 821-1666-3563",
              style: AppTextStyles.bodyText,
            ),
            const SizedBox(height: 40),
            // Placeholder for login inputs since the screenshot doesn't explicitly show them but implies them. 
            // However, the screenshot looks like a "Help" or "Info" overlay. 
            // I will add a button to navigate to the "Main App" for demo purposes.
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryRed,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                   Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text("Simulate Login (Demo)", style: AppTextStyles.heading3.copyWith(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _LanguageButton({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label == 'ID')
           // Flag placeholder
           Container(width: 40, height: 25, color: Colors.red), // Simple representation
        if (label == 'EN')
           // Flag placeholder
           Container(width: 40, height: 25, color: Colors.blue), // Simple representation
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.heading3.copyWith(
            decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
             decorationThickness: 4,
          ),
        ),
      ],
    );
  }
}
