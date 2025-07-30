import 'package:bus_schedule_app/components/constant.dart';
import 'package:bus_schedule_app/widgets/input_text_container.dart';
import 'package:bus_schedule_app/router/named_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _signUp() async {
    if (_nameController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    try {
      setState(() => _isLoading = true);

      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      await userCredential.user?.updateDisplayName(_nameController.text.trim());

      // Save additional details in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', _nameController.text.trim());
      await prefs.setString('username', _usernameController.text.trim());
      await prefs.setString('phone', _phoneController.text.trim());
      await prefs.setString('email', _emailController.text.trim());

      if (mounted) {
        GoRouter.of(context).pushReplacement(UserRoutes.dashboard);
      }
    } on FirebaseAuthException catch (e) {
      String message = 'Registration failed';
      switch (e.code) {
        case 'weak-password':
          message = 'The password provided is too weak';
          break;
        case 'email-already-in-use':
          message = 'An account already exists for that email';
          break;
        case 'invalid-email':
          message = 'Invalid email address';
          break;
        default:
          message = e.message ?? 'Registration failed';
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
                con: _nameController,
                label: "Full Name",
              ),
              const SizedBox(height: 10),
              InputTextContainer(
                con: _usernameController,
                label: "Username",
              ),
              const SizedBox(height: 10),
              InputTextContainer(
                con: _phoneController,
                label: "Phone Number",
                // keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 20),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                GestureDetector(
                  onTap: _signUp,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: MyColors.ourPrimary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Sign Up",
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: GoogleFonts.aBeeZee(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () => GoRouter.of(context).pop(),
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: MyColors.ourPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
