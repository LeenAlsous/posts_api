class Reactions{
  final int likes;
  final int dislikes;

  const Reactions({required this.likes, required this.dislikes});

  Reactions.fromJson(Map<String, dynamic> json) : likes = json['likes'], dislikes = json['dislikes'];

  Map<String, dynamic> toJson() => {
    'likes' : likes,
    'dislikes' : dislikes
  };
}