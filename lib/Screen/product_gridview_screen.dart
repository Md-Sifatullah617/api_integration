import 'package:api_integraton/Screen/product_create_screen.dart';
import 'package:api_integraton/Screen/product_update_screen.dart';
import 'package:api_integraton/Style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestAPI/rest_client.dart';

class ProductGVScreen extends StatefulWidget {
  const ProductGVScreen({super.key});

  @override
  State<ProductGVScreen> createState() => _ProductGVScreenState();
}

class _ProductGVScreenState extends State<ProductGVScreen> {
  List productList = [];
  bool loading = true;
  callData() async {
    loading = true;
    var data = await productGVLRequest();
    setState(() {
      productList = data;
      loading = false;
    });
  }

  deleteItem(id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Delete !"),
            content: const Text("Do you really want to delete?"),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No")),
              OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      loading = true;
                    });
                    await productDeleteRequest(id);
                    await callData();
                  },
                  child: const Text("Yes"))
            ],
          );
        });
  }

  goToUpdate(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PUpdateScreen()));
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
              ? (const Center(
                  child: CircularProgressIndicator(),
                ))
              : RefreshIndicator(
                  onRefresh: () async {
                    await callData();
                  },
                  child: (GridView.builder(
                      gridDelegate: pGVDStyle(),
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                  child: Image.network(
                                productList[index]["Img"],
                                fit: BoxFit.fill,
                              )),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 5, 5, 8),
                                  child: Column(
                                    children: [
                                      Text(productList[index]["ProductName"]),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text("Price: " +
                                          productList[index]["UnitPrice"] +
                                          " BDT"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          OutlinedButton(
                                              onPressed: () {
                                                goToUpdate(context);
                                              },
                                              child: const Icon(
                                                CupertinoIcons
                                                    .ellipsis_vertical_circle,
                                                size: 18,
                                              )),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          OutlinedButton(
                                              onPressed: () {
                                                deleteItem(
                                                    productList[index]["_id"]);
                                              },
                                              child: const Icon(
                                                CupertinoIcons.delete,
                                                size: 18,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })),
                ),
        ),
        Positioned(
            right: 15,
            bottom: 15,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PCreateScreen()));
              },
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            ))
      ]),
    );
  }
}
