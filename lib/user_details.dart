import 'dart:convert';
import 'package:api_integraton/user_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  List<UserModels> userList = [];
  var data ;
  Future<void> getUserApi() async {
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'API Integration',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('HI! no data.');
                  } else {
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            children: [
                              ReusableRow(title: 'Name', value: data[index]['name'].toString()),
                              ReusableRow(title: 'Username', value: data[index]['username'].toString()),
                              ReusableRow(title: 'Email', value: data[index]['email'].toString()),
                              ReusableRow(title: 'Phone', value: data[index]['phone'].toString()),
                              ReusableRow(title: 'Website', value: data[index]['website'].toString()),
                              ReusableRow(title: 'Address', value: data[index]['address']['city'].toString()),

                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: const TextStyle(fontWeight: FontWeight.bold),),
          Text(value)
        ],
      ),
    );
  }
}

