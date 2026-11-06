import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  final nameController = TextEditingController();
  final idController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 231, 246),

      appBar: AppBar(
        title: Text("Registration"),
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
              SizedBox(height: 15),

              Icon(
                Icons.person_add_alt_1,
                size: 75,
                color: const Color.fromARGB(255, 103, 58, 183),
              ),

              SizedBox(height: 10),

              Text(
                "Create Account",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),

              Text(
                "Join your campus events today!",
                style: TextStyle(
                  color: const Color.fromARGB(255, 94, 53, 177),
                  fontSize: 15,
                ),
              ),

              SizedBox(height: 25),

              TextFormField(
                controller: nameController,

                decoration: InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter your name";
                  }

                  if (!RegExp(r'^[a-zA-Z ]{3,}$').hasMatch(value.trim())) {
                    return "Enter a valid name";
                  }

                  return null;
                },
              ),

              SizedBox(height: 15),

              TextFormField(
                controller: idController,

                decoration: InputDecoration(
                  labelText: "Student ID",
                  prefixIcon: Icon(Icons.badge),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your Student ID";
                  }

                  return null;
                },
              ),

              SizedBox(height: 15),

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  labelText: "Email Address",
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white,
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

              SizedBox(height: 15),

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

              SizedBox(height: 15),

              TextFormField(
                controller: confirmPasswordController,
                obscureText: hideConfirmPassword,

                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  prefixIcon: Icon(Icons.lock_outline),

                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hideConfirmPassword = !hideConfirmPassword;
                      });
                    },
                    icon: Icon(
                      hideConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
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
                    return "Confirm your password";
                  }

                  if (value != passwordController.text) {
                    return "Password does not match";
                  }

                  return null;
                },
              ),

              SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 52,

                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Registration form is valid!")),
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

                  child: Text("Register", style: TextStyle(fontSize: 17)),
                ),
              ),

              SizedBox(height: 15),

              Text("Already have an account?"),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
