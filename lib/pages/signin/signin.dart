import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signin"),
      ),
      body: Padding(padding: const EdgeInsets.all(27)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        isExtended: true,
        child: const Icon(Icons.add),
      ),
    );
  }
}
