import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<void> _handleForgotPass() async {}
  Future<void> _handleLogin() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(children: [
          const Text(
            "Login",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          const TextField(
            decoration: InputDecoration(
                hintText: "Enter your username",
                prefixIcon: Icon(Icons.person_outline)),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            decoration: InputDecoration(
                hintText: "Enter your password",
                prefixIcon: Icon(Icons.lock_outline)),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
                style: const ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                onPressed: _handleForgotPass,
                child: const Text(
                  "Forgot Your Password?",
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton(
            onPressed: _handleLogin,
            style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size(500, 50)),
            ),
            child: const Text("Login"),
          )
        ]),
      ),
    );
  }
}
