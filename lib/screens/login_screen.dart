import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../widgets/login_help_bottom_sheet.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController(text: "mahasiswa@365.telkomuniversity.ac.id");
  final TextEditingController _passwordController = TextEditingController(text: "password123");

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Height of the screen
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Section with Image and Curve
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  clipper: HeaderCurveClipper(),
                  child: Container(
                    height: screenHeight * 0.35,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.lightGrey, // Placeholder color
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://via.placeholder.com/800x600', // Placeholder image
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // If you have a local asset, swap NetworkImage with AssetImage
                    // child: Image.asset('assets/images/building.jpg', fit: BoxFit.cover),
                  ),
                ),
                // Logo overlapping
                Transform.translate(
                  offset: const Offset(0, 40), // Push down by 40
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryRed,
                        shape: BoxShape.circle,
                      ),
                      // Using a placeholder icon related to education/university
                      child: const Icon(
                        Icons.school,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60), // Space for the overlapping logo

            // Login Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Email
                  const Text(
                    "Email 365",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown, width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryRed, width: 2),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Password
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown, width: 2),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryRed, width: 2),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Mock Login Logic
                        if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                           Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          // Allow empty for testing convenience, or show snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please enter any email and password to login (Demo mode)")),
                          );
                          // For now, let's just let them in if they really want, or enforce non-empty
                          // Enforcing non-empty is better for "realism"
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryRed,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Help Text
                  Center(
                    child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) => const LoginHelpBottomSheet(),
                        );
                      },
                      child: const Text(
                        "Bantuan ?",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Bottom Wave
             SizedBox(
              height: 120,
              width: double.infinity,
              child: CustomPaint(
                painter: BottomWavePainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    
    // Create a quadratic bezier curve
    // Control point is slightly outside the center to make it asymmetrical if needed, 
    // but the design looks fairly symmetrical or slightly tilted.
    // Let's make a standard concave arc.
    path.quadraticBezierTo(
      size.width / 2, size.height + 20, // Control point below the line
      size.width, size.height - 80, // End point
    );
    
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFFB74C4C) // A brownish-red, matching the bottom wave
      ..style = PaintingStyle.fill;
      // You might want to grab this color from AppColors if added, otherwise hardcoded for now 
      // based on the image which looks like a lighter/desaturated red.

    Path path = Path();
    path.moveTo(0, size.height); 
    path.lineTo(0, size.height * 0.4); 

    // Wave curve
    path.cubicTo(
      size.width * 0.3, -20, // Control point 1 (up)
      size.width * 0.6, size.height + 20, // Control point 2 (down)
      size.width, size.height * 0.5, // End point
    );

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
