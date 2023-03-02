import 'package:api_integraton/Style/style.dart';
import 'package:flutter/material.dart';

class PUpdateScreen extends StatefulWidget {
  const PUpdateScreen({super.key});

  @override
  State<PUpdateScreen> createState() => _PUpdateScreenState();
}

class _PUpdateScreenState extends State<PUpdateScreen> {
  Map<String, String> formValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };
  inputOnChange(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Product")),
      body: Stack(children: [
        screenBackground(context),
        Container(
          child: Column(children: [
            TextFormField(
              onChanged: (textValue) {
                inputOnChange("ProductName", textValue);
              },
              decoration: appInputDecoration("ProductName"),
            )
          ]),
        )
      ]),
    );
  }
}
