import 'package:posts_api/business_logic/models/reactions_model.dart';

  class Post {
  final int postId;
  final String title;
  final String body;
  final List<String> tags;
  final Reactions reactions;
  final int views;

  const Post(
      {required this.postId,
      required this.title,
      required this.body,
      required this.tags,
      required this.reactions,
      required this.views});

  Post.fromJson(Map<String, dynamic> json)
      : postId = json['id'] as int,
        title = json['title'] as String,
        body = json['body'] as String,
        tags = List<String>.from(json['tags'].map((tag) => tag)),
        reactions = Reactions.fromJson(json['reactions']),
        views = json['views'] as int;

  Map<String, dynamic> toJson() => {
        'id': postId,
        'title': title,
        'body': body,
        'tags': tags,
        'reactions': reactions.toJson(),
        'views': views
      };
}
