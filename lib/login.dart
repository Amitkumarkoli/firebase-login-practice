import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_practice2/forgot.dart';
import 'package:firebase_auth_practice2/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signin()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(hintText: 'Enter eamil'),
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(hintText: 'Enter password'),
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: (()=>signin()), 
              child: const Text('Log In')),
              const SizedBox(height: 30),
            ElevatedButton(
              onPressed: (()=>Get.to(const SignUp())), 
              child: const Text('sign up')),
              const SizedBox(height: 30),
            ElevatedButton(
              onPressed: (()=>Get.to(const Forgot())), 
              child: const Text('Forgot password ?'))
          ],
        ),
      )
    );
  }
}