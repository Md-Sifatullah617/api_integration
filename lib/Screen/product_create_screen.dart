import 'package:api_integraton/Screen/product_gridview_screen.dart';
import 'package:api_integraton/Style/style.dart';
import 'package:flutter/material.dart';

import '../RestAPI/rest_client.dart';

class PCreateScreen extends StatefulWidget {
  const PCreateScreen({super.key});

  @override
  State<PCreateScreen> createState() => _PCreateScreenState();
}

class _PCreateScreenState extends State<PCreateScreen> {
  Map<String, String> formValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };
  bool loading = false;
  inputOnChange(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
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
      await productCreateRequest(formValues);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const ProductGVScreen()), (route) => false);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Product")),
      body: Stack(children: [
        screenBackground(context),
        Container(
          child: loading
              ? const Center(child: (CircularProgressIndicator()))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(children: [
                      TextFormField(
                        onChanged: (textValue) {
                          inputOnChange("ProductName", textValue);
                        },
                        decoration: appInputDecoration("Product Name"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (textValue) {
                          inputOnChange("ProductCode", textValue);
                        },
                        decoration: appInputDecoration("Product Code"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (textValue) {
                          inputOnChange("Img", textValue);
                        },
                        decoration: appInputDecoration("Product Image"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (textValue) {
                          inputOnChange("UnitPrice", textValue);
                        },
                        decoration: appInputDecoration("Unit Price"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (textValue) {
                          inputOnChange("TotalPrice", textValue);
                        },
                        decoration: appInputDecoration("Total Price"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      appDropdownStyle(
                        DropdownButton(
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
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            formOnSubmit();
                          },
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
