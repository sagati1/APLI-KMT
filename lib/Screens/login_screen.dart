import 'package:bus_schedule_app/components/constant.dart';
import 'package:bus_schedule_app/router/named_routes.dart';
import 'package:bus_schedule_app/widgets/input_text_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  Future<void> _saveLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", true);
  }

  Future<void> signInWithGoogle() async {
    try {
      setState(() => _isLoading = true);

      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );

      await googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        setState(() => _isLoading = false);
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (mounted && userCredential.user != null) {
        await _saveLoginState();

        GoRouter.of(context).pushReplacement(UserRoutes.dashboard);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Google Sign-In failed: ${e.toString()}'),
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> signInWithEmailPassword() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }
    try {
      setState(() => _isLoading = true);
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (userCredential.user != null) {
        await _saveLoginState();

        if (mounted) {
          GoRouter.of(context).pushReplacement(UserRoutes.dashboard);
        }
      }
    } on FirebaseAuthException catch (e) {
      String message = 'An error occurred';
      switch (e.code) {
        case 'user-not-found':
          message = 'No user found with this email';
          break;
        case 'wrong-password':
          message = 'Wrong password provided';
          break;
        case 'invalid-email':
          message = 'Invalid email address';
          break;
        case 'user-disabled':
          message = 'This account has been disabled';
          break;
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.1),
              SizedBox(
                height: screenHeight * 0.35,
                width: double.infinity,
                child: Image.asset(
                  "assets/kmt 24.jpg",
                  fit: BoxFit.fitHeight,
                ),
              ),
              InputTextContainer(
                con: _emailController,
                label: "Email",
              ),
              const SizedBox(height: 10),
              InputTextContainer(
                con: _passwordController,
                label: "Password",
                isPassword: true,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          GoRouter.of(context).pushNamed(UserRoutes.signUp),
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color: MyColors.ourPrimary,
                        ),
                      ),
                    ),
                    Text(
                      "Forgot Password?",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                GestureDetector(
                  onTap: signInWithEmailPassword,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: MyColors.ourPrimary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 10,
                      thickness: 1,
                    ),
                  ),
                  Text(
                    "Or continue with",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      indent: 10,
                      endIndent: 40,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              GestureDetector(
                onTap: signInWithGoogle,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(
                    "assets/images/google.png",
                    height: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
