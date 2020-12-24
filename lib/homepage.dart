import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List movieList = Movie.getMovies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Text("${movieList[0].id}",style: TextStyle(
          fontSize: 18.0,
        ),
        ),
      ),


      
    );
  }
}

class Movie{

static List<Movie> getMovies() =>[

Movie(
  id: "1",
name: "Hero"),

];

  String name;
  String id;
  Movie({this.name, this.id });

}