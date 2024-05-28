import 'package:flutter/material.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loginPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!isValidEmail(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              icon: const Icon(Icons.login),
              label: const Text('Login'),
              onPressed: () {
                setState(() {
                  loginPressed = true;
                });
                // Perform login logic here
              },
            ),
             const SizedBox(height: 5, width: 5),
            if (loginPressed) const Icon(Icons.gpp_good, color: Colors.green,weight: 30,),
            const SizedBox(height: 5, width: 5,),
            ElevatedButton.icon(
              icon: const Icon(Icons.person_add),
              label: const Text('Sign Up'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationPage()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email);
  }
}