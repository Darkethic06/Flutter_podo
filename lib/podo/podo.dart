import 'package:flutter/material.dart';
import 'package:tute_2/podo/post.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';


class Podo extends StatefulWidget {
  @override
  _PodoState createState() => _PodoState();
}

class _PodoState extends State<Podo> {
  Future <PostList> data ;
 
  @override
  void initState(){
    super.initState();
     Network network = Network("http://jsonplaceholder.typicode.com/posts");  // Network(url)
     data = network.loadPosts();
  }

//   void dispose(){
//   super.dispose();
//   //  Network network = Network("http://jsonplaceholder.typicode.com/posts");  // Network(url)
//   //    data = network.loadPosts();
// }
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
          child:FutureBuilder(
            future: data,
            builder: (context , AsyncSnapshot<PostList> Snapshot){
              List <Post> allPosts;
              if (Snapshot.hasData){
                allPosts = Snapshot.data.posts;
                return CreateListView(allPosts , context);
              }else{
                return CircularProgressIndicator();
              }

            }

          ),
        ),
      ),
      
    );
  }
  Widget CreateListView(List<Post> data , BuildContext context){

    return Container(
          child: ListView.builder(
            itemCount:data.length,
            itemBuilder: (context , int index){
              return Column(
                children: [
                  Divider(height:5.0),
                  ListTile(
                    title: Text("${data[index].title}"),

                    leading: Column(
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: 25,
                            child: Text("${data[index].id}"),

                        ),

                    ],)
                  ),
                  

                ],
              );
            },
          ),
    );


  }
}


//singleton class

class Network{
  final String url ;
  Network(this.url);

  Future <PostList> loadPosts() async {
    final response = await get(Uri.encodeFull(url));

    if (response.statusCode == 200){  // 200 means ok
      return PostList.fromJson(json.decode(response.body));
    }else{
      throw Exception("failed to load data");
    }

  } 
}




