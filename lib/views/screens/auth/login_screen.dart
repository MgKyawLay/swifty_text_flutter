import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/services.dart';
import 'package:swifty_text_flutter/views/screens/auth/forgot_password_screen.dart';
import 'package:swifty_text_flutter/views/screens/auth/signup_screen.dart';
import 'package:swifty_text_flutter/views/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late bool showPassword;

  @override
  void initState() {
    super.initState();
    showPassword = false;
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  Future<void> _handleShowPassword() async {
    setState(() {
      showPassword = !showPassword;
    });
  }

  Future<void> _handleForgotPassword() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
  }

  Future<void> _handleSignup() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login",
            style: const TextStyle()
                .copyWith(fontSize: 40, fontWeight: FontWeight.bold)),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white10,
            statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Text(
                //   "Login",
                //   style: const TextStyle().copyWith(
                //     fontSize: 40,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
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
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                          onPressed: _handleShowPassword,
                          icon: Icon(
                              showPassword ? EvaIcons.eye : EvaIcons.eyeOff)),
                      hintText: "Enter your password"),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter username!';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: _handleForgotPassword,
                        style: const ButtonStyle().copyWith(
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent)),
                        child: const Text('Forgot your password?')),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                FilledButton(
                  onPressed: _handleLogin,
                  style: const ButtonStyle(
                      fixedSize:
                          MaterialStatePropertyAll(Size(double.maxFinite, 50))),
                  child: const Text("Log In"),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Text("OR"),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                FilledButton(
                  onPressed: _handleSignup,
                  style: const ButtonStyle(
                    fixedSize:
                        MaterialStatePropertyAll(Size(double.maxFinite, 50)),
                  ),
                  child: const Text("Sign Up"),
                ),
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
                ),
              ],
            )),
      ),
    );
  }
}
