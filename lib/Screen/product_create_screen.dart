import 'package:flutter/material.dart';

class PCreateScreen extends StatefulWidget {
  const PCreateScreen({super.key});

  @override
  State<PCreateScreen> createState() => _PCreateScreenState();
}

class _PCreateScreenState extends State<PCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Product")),
      body: Stack(children: [
        Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(children: [
                TextFormField(
                  onChanged: (value) {},
                ),
                TextFormField(
                  onChanged: (value) {},
                ),
                TextFormField(
                  onChanged: (value) {},
                ),
                TextFormField(
                  onChanged: (value) {},
                ),
                TextFormField(
                  onChanged: (value) {},
                ),
              ]),
            ),
          ),
        )
      ]),
    );
  }
}
