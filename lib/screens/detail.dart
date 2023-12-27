import 'package:flutter/material.dart';

class Screendetailed extends StatelessWidget {
  const Screendetailed({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name),
            const Text('24'),
            const Text('xyz@gmail.com'),
          ],
        ),
      ),
    );
  }
}
