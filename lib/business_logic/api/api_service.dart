import 'dart:convert';

import 'package:posts_api/business_logic/models/data_model.dart';
import 'package:http/http.dart' as http;
class ApiService{
  static const String _uri = 'https://dummyjson.com/posts';
  final Uri _parsedUri = Uri.parse(_uri);

  Future<DataModel> getData() async{
    final postsResponse = await http.get(_parsedUri);
    if(postsResponse.statusCode == 200){
      final decodedPostsResponse = jsonDecode(postsResponse.body);
      final data = DataModel.fromJson(decodedPostsResponse);
      return data;
    } else{
      throw Exception('Loading data failed');
    }
  }
}