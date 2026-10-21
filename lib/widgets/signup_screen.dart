import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Sign up'),
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

  void _signup() {
    if (_nameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _passwordController.text.isEmpty) {
      _showMessage('Fill in your name, email and password.');
      return;
    }
    _showMessage('The registration form is ready. No account was created.');
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
                      'Sign up',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 26),
                  const Text('Name:'),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _nameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 14),
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
                  const SizedBox(height: 14),
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
                      onPressed: _signup,
                      child: const Text('Sign up'),
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
