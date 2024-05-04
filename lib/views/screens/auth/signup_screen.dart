import 'package:email_validator/email_validator.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<StatefulWidget> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  late bool showPassword;

  @override
  void initState() {
    super.initState();
    showPassword = false;
  }

  Future<void> _handleSignup() async {
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
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: const TextStyle()
                        .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration().copyWith(
                      hintText: 'Username',
                      prefixIcon: const Icon(EvaIcons.personOutline),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Enter username!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration().copyWith(
                        hintText: 'Email',
                        prefixIcon: const Icon(EvaIcons.emailOutline)),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Enter username!";
                      } else if (EmailValidator.validate(val) == false) {
                        return "Email Wrong format!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !showPassword,
                    decoration: const InputDecoration().copyWith(
                        hintText: 'Password',
                        prefixIcon: const Icon(EvaIcons.lockOutline),
                        suffixIcon: IconButton(
                            onPressed: _handleShowPassword,
                            icon: Icon(showPassword
                                ? EvaIcons.eyeOffOutline
                                : EvaIcons.eye))),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Enter username!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: !showPassword,
                    decoration: const InputDecoration().copyWith(
                        hintText: 'Re-password',
                        prefixIcon: const Icon(EvaIcons.lockOutline),
                        suffixIcon: IconButton(
                            onPressed: _handleShowPassword,
                            icon: Icon(showPassword
                                ? EvaIcons.eyeOffOutline
                                : EvaIcons.eye))),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Enter password!";
                      } else if (_passwordController.text != val) {
                        return "Password do not match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FilledButton(
                    onPressed: _handleSignup,
                    style: const ButtonStyle().copyWith(
                        fixedSize: const MaterialStatePropertyAll(
                            Size(double.maxFinite, 50))),
                    child: const Text('Sign Up'),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
