import 'package:flutter/material.dart';

import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  bool hidePassword = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 231, 246),

      appBar: AppBar(
        title: Text("Campus Event"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 49, 27, 146),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),

        child: Form(
          key: formKey,

          child: Column(
            children: [
              SizedBox(height: 35),

              Icon(
                Icons.event_available,
                size: 85,
                color: const Color.fromARGB(255, 103, 58, 183),
              ),

              SizedBox(height: 15),

              Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),

              Text(
                "Login to explore campus events",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 94, 53, 177),
                ),
              ),

              SizedBox(height: 35),

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  labelText: "Email Address",
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 209, 196, 233),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your email";
                  }

                  if (!RegExp(r'^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}$')
                      .hasMatch(value)) {
                    return "Enter a valid email";
                  }

                  return null;
                },
              ),

              SizedBox(height: 20),

              TextFormField(
                controller: passwordController,
                obscureText: hidePassword,

                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),

                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),

                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your password";
                  }

                  if (!RegExp(
                    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$',
                  ).hasMatch(value)) {
                    return "Use 8+ characters with uppercase,\nlowercase, number and special character";
                  }

                  return null;
                },
              ),

              SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 52,

                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login form is valid")),
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 103, 58, 183),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  child: Text("Login", style: TextStyle(fontSize: 17)),
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationPage(),
                        ),
                      );
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
