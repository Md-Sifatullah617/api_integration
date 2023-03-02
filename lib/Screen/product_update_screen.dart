import 'package:api_integraton/Style/style.dart';
import 'package:flutter/material.dart';

import '../RestAPI/rest_client.dart';

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
  bool loading=false;

  formOnSubmit(){
    if (formValues["Img"]!.isEmpty) {
      errorToast("Image Link Required !");
    } else if (formValues["ProductCode"]!.isEmpty) {
      errorToast("Product Code Required !");
    } else if (formValues["ProductName"]!.isEmpty) {
      errorToast("Product Name Required !");
    } else if (formValues["Qty"]!.isEmpty) {
      errorToast("Qty Required !");
    } else if (formValues["TotalPrice"]!.isEmpty) {
      errorToast("Total Price Required !");
    } else if (formValues["UnitPrice"]!.isEmpty) {
      errorToast("Unit Price Required !");
    } else {
      setState(() {
        loading = true;
      });
      productCreateRequest(formValues);
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Product")),
      body: Stack(children: [
        screenBackground(context),
        Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(children: [
                TextFormField(
                  onChanged: (textValue) {
                    inputOnChange("ProductName", textValue);
                  },
                  decoration: appInputDecoration("ProductName"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (textValue) {
                    inputOnChange("ProductCode", textValue);
                  },
                  decoration: appInputDecoration("ProductCode"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (textValue) {
                    inputOnChange("Img", textValue);
                  },
                  decoration: appInputDecoration("Img"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (textValue) {
                    inputOnChange("UnitPrice", textValue);
                  },
                  decoration: appInputDecoration("UnitPrice"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (textValue) {
                    inputOnChange("TotalPrice", textValue);
                  },
                  decoration: appInputDecoration("TotalPrice"),
                ),
                const SizedBox(
                  height: 20,
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
                    )
                  ],
                  onChanged: (textValue) {
                    inputOnChange("Qty", textValue);
                  },
                  isExpanded: true,
                  underline: Container(),
                )),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      formOnSubmit();
                    },
                    style: appButtonStyle(),
                    child: successButton("Submit"))
              ]),
            ),
          ),
        )
      ]),
    );
  }
}
