import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posts_api/helper/text_scale.dart';
import 'package:posts_api/presentation/widgets/tag_container.dart';

class PostsContainer extends StatelessWidget {
  const PostsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: MediaQuery.sizeOf(context).height / 2.5,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context))),
              SizedBox(height: MediaQuery.sizeOf(context).height / 50,),
              Text('Body', style: const TextStyle(fontSize: 18), textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context))),
              Spacer(),
              Text('tags', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context))),
              SizedBox(height: MediaQuery.sizeOf(context).height / 80,),
              const Row(children: [
                TagContainer(),
                TagContainer(),
                TagContainer(),
              ],),
              SizedBox(height: MediaQuery.sizeOf(context).height / 50,),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: MediaQuery.sizeOf(context).width / 2.5,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Icon(Icons.thumb_up),
                    Text('90'),
                    Icon(Icons.thumb_down),
                    Text('3'),
                    Icon(Icons.remove_red_eye),
                    Text('428')
                  ],),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
