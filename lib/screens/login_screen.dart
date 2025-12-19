import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../core/app_colors.dart';
import '../widgets/login_help_bottom_sheet.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
      return;
    }

    // Unfocus before potential navigation or state change
    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
      _isLoading = true;
    });

    try {
      // 3. Proses di Server Firebase
      // Validasi Kredensial: Firebase checks email and password against database
      // Pengecekan Status: Ensures account is active
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      // 4. Respons dan Manajemen Sesi
      // Berhasil: Firebase returns UserCredential, token stored locally
      // 5. Pengalihan Halaman (Navigation)
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      // Gagal: Firebase returns error code
      String message = "Login failed";
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is not valid.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> handleDemoLogin() async {
    // Unfocus before major UI change
    FocusManager.instance.primaryFocus?.unfocus();

    // 1. Isi field input (Auto-fill)
    _emailController.text = "admin@lms.com";
    _passwordController.text = "admin123";

    setState(() {
      _isLoading = true;
    });

    // Simulasi loading sebentar agar terasa seperti proses asli
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
      // Langsung pindah ke halaman Home tanpa cek Firebase (Bypass)
      _navigateToHome();
    }
  }

  // Fungsi pembantu untuk navigasi
  void _navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  // Fungsi pembantu untuk pesan error
  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: Colors.red),
    );
  }

  // Fungsi pembantu untuk handle Firebase error
  void _handleFirebaseError(FirebaseAuthException e) {
    String message = "";
    switch (e.code) {
      case 'wrong-password':
        message = "Password akun demo salah.";
        break;
      case 'user-disabled':
        message = "Akun demo ini telah dinonaktifkan.";
        break;
      case 'network-request-failed':
        message = "Periksa koneksi internet Anda.";
        break;
      default:
        message = "Terjadi kesalahan: ${e.message}";
    }
    _showError(message);
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
                      color: AppColors.primaryRed, // Use solid color instead of network image to avoid CORS issues
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
                    focusNode: _emailFocusNode,
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

                  const SizedBox(height: 16),

                  // Demo Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: _isLoading ? null : handleDemoLogin,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primaryRed, width: 2),
                        foregroundColor: AppColors.primaryRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: AppColors.primaryRed)
                          : const Text(
                              "Demo Login",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                    focusNode: _passwordFocusNode,
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
                      onPressed: _isLoading ? null : _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryRed,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 5,
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Register Link
                  Center(
                    child: TextButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        "Don't have an account? Register",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

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
