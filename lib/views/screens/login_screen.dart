import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {}
  }

  Future<void> _handleShowPassword() async {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: "Enter your email address"),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Plase enter email!';
                    } else if (EmailValidator.validate(val) == false) {
                      return 'Wrong email format!';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: showPassword,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      suffixIcon: IconButton(
                          onPressed: _handleShowPassword,
                          icon: Icon(
                              showPassword ? EvaIcons.eyeOff : EvaIcons.eye)),
                      hintText: "Enter your password"),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter username!';
                    }
                    return null;
                  },
                ),
                FilledButton(
                  onPressed: _handleLogin,
                  child: Text("Log In"),
                  style: const ButtonStyle(
                      fixedSize:
                          MaterialStatePropertyAll(Size(double.maxFinite, 50))),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text("Or Sign Up Using"),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        EvaIcons.facebook,
                        color: Colors.white,
                      ),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 1, 127, 254))),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          EvaIcons.twitter,
                          color: Colors.white,
                        ),
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.lightBlue))),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        EvaIcons.google,
                        color: Colors.white,
                      ),
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red)),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
