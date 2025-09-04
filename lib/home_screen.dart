import 'package:flutter/material.dart';
import 'package:form/second_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidedenpassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Screen")),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              "assets/flutter_icon_130936.png",
              width: 100,
              height: 100,
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains("@")) {
                    return "Please enter valid email";
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: "Email"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: hidedenpassword,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return "Please must be 6 char long";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      togglePassword();
                    },
                    icon: Icon(
                      hidedenpassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint(emailController.text);
                debugPrint(passwordController.text);
                if (_formKey.currentState!.validate()) {
                  // myDialog();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondScreen(),
                    ),
                  );

                  // SnackBar snackBar = SnackBar(
                  //   content: Text("you are logged"),
                  //   duration: Duration(seconds: 2),
                  //   backgroundColor: Colors.green,
                  //   action: SnackBarAction(label: "ok", onPressed: () {}),
                  // );
                  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  SnackBar snackBar = SnackBar(
                    content: const Text("Please fill all the field"),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.red,
                    action: SnackBarAction(
                      label: "OK",
                      textColor: Colors.white,
                      disabledTextColor: Colors.grey,
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  togglePassword() {
    hidedenpassword = !hidedenpassword;
    setState(() {});
  }

  Future<void> myDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hello'),
          content: Text("Welcome to App"),
          actions: <Widget>[
            TextButton(
              child: const Text('Thanks !'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
