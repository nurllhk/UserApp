import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userapp/controllers/participants_controller.dart';
import 'package:userapp/models/user.dart';
import 'package:userapp/services/auth_serivice.dart';
import 'package:userapp/views/login_view.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        child: const Icon(
          Icons.arrow_back_ios_new_sharp,
          color: Colors.white,
        ),
      ),
      body: FutureBuilder(
          future: ref.watch(participantsProvider).fetchUsers(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? dataToReturn(snapshot, snapshot.data!, context)
                : const CircularProgressIndicator.adaptive();
          }),
    );
  }
}

Widget dataToReturn(
    AsyncSnapshot asyncSnapshot, List<Users> users, BuildContext context) {
  if (asyncSnapshot.hasData) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 8,
                    child: Image.network(users[index].avatar)),
              ),
              title:
                  Text("${users[index].firstName} ${users[index].lastName} "),
              subtitle: Text(users[index].email),
            );
          }),
    );
  }
  return const Center(
    child: Text("Error"),
  );
}

 // TODO   eve.holt@reqres.in