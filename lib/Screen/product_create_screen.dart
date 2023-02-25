import 'package:api_integraton/Style/style.dart';
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
        screenBackground(context),
        Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(children: [
                TextFormField(
                  onChanged: (value) {},
                  decoration: appInputDecoration("Product Name"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {},
                  decoration: appInputDecoration("Product Code"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {},
                  decoration: appInputDecoration("Product Image"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {},
                  decoration: appInputDecoration("Unit Price"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {},
                  decoration: appInputDecoration("Total Price"),
                ),
                const SizedBox(
                  height: 20,
                ),
                appDropdownStyle(
                  DropdownButton(
                    value: "",
                    items: const [
                      DropdownMenuItem(
                        value: "",
                        child: Text("Select Qt"),
                      ),
                      DropdownMenuItem(
                        value: "1 pcs",
                        child: Text("1 pcs"),
                      ),
                      DropdownMenuItem(
                        value: "2 pcs",
                        child: Text("2 pcs"),
                      ),
                      DropdownMenuItem(
                        value: "3 pcs",
                        child: Text("3 pcs"),
                      ),
                      DropdownMenuItem(
                        value: "4 pcs",
                        child: Text("4 pcs"),
                      )
                    ],
                    onChanged: (value) {},
                    isExpanded: true,
                    underline: Container(),
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){}, 
                style: appButtonStyle(),
                child: successButton("Submit")),
              ]),
            ),
          ),
        )
      ]),
    );
  }
}
