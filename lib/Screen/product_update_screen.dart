import 'package:flutter/material.dart';


class PUpdateScreen extends StatefulWidget {
  const PUpdateScreen({super.key});

  @override
  State<PUpdateScreen> createState() => _PUpdateScreenState();
}

class _PUpdateScreenState extends State<PUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Update Product")),
    );
  }
}