import 'package:posts_api/business_logic/models/post_model.dart';

class DataModel{
  final List<Post> posts;
  final int skip;
  final int limit;
  final int total;

  DataModel({required this.posts, required this.skip, required this.limit, required this.total});

  DataModel.fromJson(Map<String, dynamic> json) : posts = List<Post>.from(json['posts'].map((post) => Post.fromJson(post))),
  skip = json['skip'] as int,
  limit = json['limit'] as int,
  total = json['total'] as int;

  Map<String, dynamic> toJson() => {
    'posts' : List<dynamic>.from(posts.map((post) => post.toJson())),
    'skip' : skip,
    'limit' : limit,
    'total' : total
  };
}