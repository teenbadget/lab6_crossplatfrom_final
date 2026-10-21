import 'package:flutter/material.dart';
import 'reset_password_screen.dart';
import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Sign in'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _login() {
    if (_emailController.text.trim().isEmpty ||
        _passwordController.text.isEmpty) {
      _showMessage('Enter your email and password.');
      return;
    }
    _showMessage('The sign-in form is ready. Authentication is not connected.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/flutter_logo.png',
                      width: 165,
                      height: 68,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text('Email:'),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Password:'),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _passwordController,
                    obscureText: _hidePassword,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      isDense: true,
                      suffixIcon: IconButton(
                        tooltip: _hidePassword ? 'Show password' : 'Hide password',
                        onPressed: () => setState(() => _hidePassword = !_hidePassword),
                        icon: Icon(
                          _hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 46,
                    child: ElevatedButton(
                      onPressed: _login,
                      child: const Text('Login'),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) => const ResetPasswordScreen(),
                      ),
                    ),
                    child: const Text('Forgot password?'),
                  ),
                  OutlinedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) => const SignupScreen(),
                      ),
                    ),
                    child: const Text('Sign up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
