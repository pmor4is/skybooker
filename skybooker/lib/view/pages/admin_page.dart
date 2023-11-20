import 'package:flutter/material.dart';
import 'package:skybooker/view/pages/admin_page_create.dart';
import 'package:skybooker/view/pages/admin_page_read.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Criar novas viagens"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateData()));
              },
            ),
            const SizedBox(height: 12,),
            ElevatedButton(
              child: const Text("Ver viagens cadastradas"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminPageData()));
              },
            ),
          ],
        ),
      ),
    );
  }
}