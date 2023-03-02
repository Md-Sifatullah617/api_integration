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
            ),
            TextFormField(
              onChanged: (textValue) {
                inputOnChange("ProductCode", textValue);
              },
              decoration: appInputDecoration("ProductCode"),
            ),
            TextFormField(
              onChanged: (textValue) {
                inputOnChange("Img", textValue);
              },
              decoration: appInputDecoration("Img"),
            ),
            TextFormField(
              onChanged: (textValue) {
                inputOnChange("UnitPrice", textValue);
              },
              decoration: appInputDecoration("UnitPrice"),
            ),
            TextFormField(
              onChanged: (textValue) {
                inputOnChange("TotalPrice", textValue);
              },
              decoration: appInputDecoration("TotalPrice"),
            ),
            appDropdownStyle(DropdownButton(
                value: formValues["Qty"],
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
                      )], onChanged: (textValue) {
                      inputOnChange("Qty", textValue);
                    },
                    isExpanded: true,
                    underline: Container(),
                    ))
            
          ]),
        )
      ]),
    );
  }
}
