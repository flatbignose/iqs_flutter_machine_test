import 'package:flutter/material.dart';
import 'package:iqs_flutter_machine_test/provider/api_provider.dart';
import 'package:provider/provider.dart';

class ScreenOnline extends StatelessWidget {
  const ScreenOnline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Users'),
      ),
      body: SafeArea(
        child: Consumer<ApiProvider>(builder: (context, apiPro, _) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final data = apiPro.users[index];
              return Container(
                child: ListTile(
                  title: Text(data.name),
                ),
              );
            },
            itemCount: apiPro.users.length,
          );
        }),
      ),
    );
  }
}
