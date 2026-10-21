import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    final email = _emailController.text.trim();
    final message = email.isEmpty
        ? 'Enter your email address.'
        : 'Password recovery for $email is a demo. No email was sent.';

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Reset password'),
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
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
                      'Reset Password',
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
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 46,
                    child: ElevatedButton(
                      onPressed: _resetPassword,
                      child: const Text('Reset'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Back'),
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
