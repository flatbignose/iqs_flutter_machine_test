// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:iqs_flutter_machine_test/provider/api_provider.dart';
import 'package:iqs_flutter_machine_test/screens/home.dart';
import 'package:iqs_flutter_machine_test/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ApiProvider>(context, listen: false).getUsers();
    super.initState();
    isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Logging In...'),
      ),
    );
  }
}

isLogin(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('userId');
  if (userId != null) {
    Future.delayed(const Duration(milliseconds: 1500)).then((value) =>
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const ScreenHome()),
            (route) => false));
  } else {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) =>
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const ScreenLogin()),
            (route) => false));
  }
}
