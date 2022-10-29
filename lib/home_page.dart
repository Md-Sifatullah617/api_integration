import 'package:api_integraton/photos.dart';
import 'package:api_integraton/post.dart';
import 'package:api_integraton/user_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      drawer: Drawer(
        child: ListView(
          children: [
            const Center(child: DrawerHeader(child: Text('Hi!'))),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
              },
              leading: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const PostApi()));
              },
              leading: const Icon(Icons.api),
              title: const Text('Post'),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const PhotosApi()));
              },
              leading: const Icon(Icons.api),
              title: const Text('Photos'),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserDetails()));
              },
              leading: const Icon(Icons.api),
              title: const Text('Users'),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: Text("loading......."))
        ],
      ),
    );
  }
}
