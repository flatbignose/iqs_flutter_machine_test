import 'package:flutter/material.dart';
import 'package:iqs_flutter_machine_test/screens/detail.dart';
import 'package:iqs_flutter_machine_test/screens/login.dart';
import 'package:iqs_flutter_machine_test/screens/online_users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (context, animate, secondanimate) {
                return const ScreenOnline();
              }, transitionsBuilder: (context, animate, secondanimate, _) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.fastOutSlowIn;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                var offsetAnimate = animate.drive(tween);

                return SlideTransition(
                  position: offsetAnimate,
                  child: _,
                );
              }));
        }),
        appBar: AppBar(
          title: const Text('IQS Home'),
          actions: [
            IconButton(
                onPressed: () {
                  logOut(context);
                },
                icon: const Icon(Icons.logout)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.sunny))
          ],
        ),
        body: SafeArea(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Screendetailed(
                                name: 'Person ${index + 1}',
                              )));
                },
                child: ListTile(
                  title: Text('Person ${index + 1}'),
                ),
              );
            },
            itemCount: 10,
          ),
        ));
  }

  logOut(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('userId');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ScreenLogin()),
        (route) => false);
  }
}
