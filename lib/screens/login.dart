import 'package:flutter/material.dart';
import 'package:iqs_flutter_machine_test/core/colors.dart';
import 'package:iqs_flutter_machine_test/core/sizes.dart';
import 'package:iqs_flutter_machine_test/screens/home.dart';
import 'package:iqs_flutter_machine_test/widgets/custom_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});
  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    final passwordController = TextEditingController();
    final screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "IQS",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            Container(
              height: screensize.height / 2,
              width: screensize.width * 0.80,
              decoration: BoxDecoration(
                  color: kblack, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomField(
                      isobscure: false,
                      controller: userController,
                      hintText: 'Enter your username here',
                    ),
                    height10,
                    height10,
                    CustomField(
                      isobscure: true,
                      controller: passwordController,
                      hintText: 'Enter your password here',
                    ),
                    height10,
                    ElevatedButton(
                        onPressed: () async {
                          login(userController, passwordController, context);
                        },
                        child: const Text('Login'))
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  void login(TextEditingController userController,
      TextEditingController passwordController, BuildContext context) async {
    if (userController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      await saveLoginInfo(loginId: userController.text);
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const ScreenHome()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          showCloseIcon: true,
          duration: Duration(milliseconds: 1500),
          content: Text('Enter All Fields')));
    }
  }
}

saveLoginInfo({required String loginId}) async {
  SharedPreferences userId = await SharedPreferences.getInstance();
  userId.setString('userId', loginId); 
}
