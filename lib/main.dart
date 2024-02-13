import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userapp/controllers/login_controller.dart';
import 'package:userapp/views/home_view.dart';
import 'package:userapp/views/login_view.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UserApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ref.watch(LoginProvider).getAuthToken() == null ? const Login():const Home(),
    );
  }
}


