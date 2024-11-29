import 'package:flutter/material.dart';
import 'package:container/dami.dart';
import 'signup_view.dart'; // Import the SignupView

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool showPass = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void login() {
    if (emailController.text == 'wazir' && passController.text == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dami()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Login'),
      ),
      body: SizedBox(
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passController,
              obscureText: !showPass,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                labelText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showPass = !showPass; // Toggle password visibility
                    });
                  },
                  icon: Icon(
                    showPass ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                login();
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupView()),
                );
              },
              child: const Text("Don't have an account? Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
