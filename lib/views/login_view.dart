
import 'package:flutter/material.dart';

import '../services/auth_serivice.dart';
import 'components/custom_input.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){

      },child: Icon(Icons.add),),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 15,
              children: [
                const Icon(
                  Icons.person,
                  size: 80,
                ),
                Align(
                  child: Text(
                    "Enter details to log in..",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                MyTextField(
                    textEditingController: emailController,
                    hintext: 'Email',
                    obsurtext: false),
                MyTextField(
                    textEditingController: passwordController,
                    hintext: 'Password',
                    obsurtext: true),
                ElevatedButton(
                  onPressed: () {
                    AuthServices().signinWithEmailAndPassword(
                        emailController.text, passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: const Size(double.infinity, 60)),
                  child: Text(
                    'Login',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }
}
