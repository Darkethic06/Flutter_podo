class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.body, this.title}); //name constructor

  //factory constractor
  //mapping

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json["userId"] as int,
      id: json["id"] as int,
      title: json["title"] as String,
      body: json["body"] as String,
    );
  }
}

class PostList {
  final List<Post> posts;
  PostList({this.posts});//nmae constructor

  //factory contructor

  factory PostList.fromJson(List<dynamic> parsedJson) {
    List<Post> posts = new List<Post>();

    posts = parsedJson.map(
        (i) => Post.fromJson(i)).toList(); // Post.fromjson(userId, id , title, body)

      return PostList(posts: posts);
  }
}
