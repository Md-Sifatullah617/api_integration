import 'dart:convert';
import 'package:api_integraton/photo_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotosApi extends StatefulWidget {
  const PhotosApi({Key? key}) : super(key: key);

  @override
  State<PhotosApi> createState() => _PhotosApiState();
}

class _PhotosApiState extends State<PhotosApi> {
  List<PhotoDetails> photoList = [];

  Future<List<PhotoDetails>> getPhotosApi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        photoList.add(PhotoDetails.fromJson(i));
      }
      return photoList;
    } else {
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'API (Photos)',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotosApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('Loading......');
                  } else {
                    return ListView.builder(
                        itemCount: photoList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data![index].url.toString()),
                            ),
                            title: Text('Notes id:${snapshot.data![index].id}'),
                            subtitle:
                                Text(snapshot.data![index].title.toString()),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
