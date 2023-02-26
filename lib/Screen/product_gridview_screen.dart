import 'package:api_integraton/Style/style.dart';
import 'package:flutter/material.dart';

import '../RestAPI/rest_client.dart';

class ProductGVScreen extends StatefulWidget {
  const ProductGVScreen({super.key});

  @override
  State<ProductGVScreen> createState() => _ProductGVScreenState();
}

class _ProductGVScreenState extends State<ProductGVScreen> {
  List productList = [];
  bool loading = false;
  callData() async {
    loading = true;
    var data = await productGVLRequest();
    setState(() {
      productList = data;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    callData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Product"),
      ),
      body: Stack(children: [
        screenBackground(context),
        Container(
          child: loading
              ? (Center(
                  child: CircularProgressIndicator(),
                ))
              : (GridView.builder(
                  gridDelegate: pGVDStyle(),
                  itemBuilder: (context, index) {
                    return Card(
                        child: Column(
                            children: [
                                
                            ],
                        ),
                    );
                  })),
        )
      ]),
    );
  }
}
