import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userapp/services/auth_serivice.dart';
import 'package:userapp/views/login_view.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String deneme = "";
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          AuthServices.deleteAuthToken();
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const Login();
          }));
        },
        child: Icon(
          Icons.arrow_back_ios_new_sharp,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Text(deneme ?? ""),
      ),
    );
  }
}
