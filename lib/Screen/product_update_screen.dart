import 'package:api_integraton/Screen/product_gridview_screen.dart';
import 'package:api_integraton/Style/style.dart';
import 'package:flutter/material.dart';

import '../RestAPI/rest_client.dart';

class PUpdateScreen extends StatefulWidget {
  final Map productItem;
  const PUpdateScreen(this.productItem, {super.key});

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
  void initState() {
    super.initState();
    formValues.update("Img", (value) => widget.productItem["Img"]);
    formValues.update(
        "ProductCode", (value) => widget.productItem["ProductCode"]);
    formValues.update(
        "ProductName", (value) => widget.productItem["ProductName"]);
    formValues.update("Qty", (value) => widget.productItem["Qty"]);
    formValues.update(
        "TotalPrice", (value) => widget.productItem["TotalPrice"]);
    formValues.update("UnitPrice", (value) => widget.productItem["UnitPrice"]);
  }

  bool loading = false;

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
      await productUpdateRequest(formValues, widget.productItem["_id"]);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> ProductGVScreen()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Product")),
      body: Stack(children: [
        screenBackground(context),
        Container(
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(children: [
                      TextFormField(
                        initialValue: formValues["ProductName"],
                        onChanged: (textValue) {
                          inputOnChange("ProductName", textValue);
                        },
                        decoration: appInputDecoration("ProductName"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: formValues["ProductCode"],
                        onChanged: (textValue) {
                          inputOnChange("ProductCode", textValue);
                        },
                        decoration: appInputDecoration("ProductCode"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: formValues["Img"],
                        onChanged: (textValue) {
                          inputOnChange("Img", textValue);
                        },
                        decoration: appInputDecoration("Img"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: formValues["UnitPrice"],
                        onChanged: (textValue) {
                          inputOnChange("UnitPrice", textValue);
                        },
                        decoration: appInputDecoration("UnitPrice"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: formValues["TotalPrice"],
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
