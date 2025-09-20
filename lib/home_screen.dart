import 'package:flutter/material.dart';
import 'navbar pages/dio_helper.dart';
import 'second_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidedenpassword = true;
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    DioHelper.init();
  }

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await DioHelper.postData(
        path: "auth/login",
        body: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );

      debugPrint("Response: ${response.data}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SecondScreen()),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login Failed ")));
      }
    } catch (e) {
      debugPrint("Error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Screen")),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset(
              "assets/flutter_icon_130936.png",
              width: 100,
              height: 100,
            ),

            // Email Field
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains("@")) {
                    return "Please enter valid email";
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: "Email"),
              ),
            ),

            // Password Field
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: hidedenpassword,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidedenpassword = !hidedenpassword;
                      });
                    },
                    icon: Icon(
                      hidedenpassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Login Button / Loader
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        login();
                      }
                    },
                    child: const Text("Login"),
                  ),
          ],
        ),
      ),
    );
  }
}
