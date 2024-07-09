import 'package:flutter/material.dart';
import 'package:posts_api/business_logic/api/api_service.dart';
import 'package:posts_api/business_logic/models/data_model.dart';
import 'package:posts_api/presentation/widgets/post_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DataModel _data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    ApiService().getData().then((data) {
      _data = data;
      isLoading = false;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFD3E4EF), Color(0xFFEADAD7)])),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 45,
              ),
             isLoading ? const Center(child: CircularProgressIndicator()) : SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView.builder(
                  itemCount: _data.posts.length,
                  itemBuilder:(context, index) => PostsContainer(
                    post: _data.posts[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
