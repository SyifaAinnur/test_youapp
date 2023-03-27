
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
      ]),
      body: Center(
        child: Column(
          children: [
            Text('Welcome home'),
          ],
        ),
      ),
    );
  }
}
