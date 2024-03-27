import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_practice2/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

   TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  SignUp()async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
    Get.offAll(const Wrapper());
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

            ElevatedButton(
              onPressed: (()=>SignUp()), 
              child: const Text('Sign Up'))
          ],
        ),
      )
    );
  }
}