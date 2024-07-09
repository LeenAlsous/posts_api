import 'package:flutter/material.dart';
import 'package:posts_api/business_logic/models/post_model.dart';
import 'package:posts_api/helper/text_scale.dart';
import 'package:posts_api/presentation/widgets/tag_container.dart';

class PostsContainer extends StatefulWidget {
  final Post post;

  const PostsContainer({Key? key, required this.post}) : super(key: key);

  @override
  State<PostsContainer> createState() => _PostsContainerState();
}

class _PostsContainerState extends State<PostsContainer> {
  bool isExpanded = false;
  double calculatedHeight = 0;

  @override
  Widget build(BuildContext context) {
    calculatedHeight = (widget.post.body.length / 5) / 7;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 15,
        shadowColor: Colors.black54,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.post.title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                    textScaler:
                        TextScaler.linear(ScaleSize.textScaleFactor(context))),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 50,
                ),
                ConstrainedBox(
                    constraints: isExpanded
                        ? BoxConstraints(
                            maxWidth: MediaQuery.sizeOf(context).width,
                            maxHeight: MediaQuery.sizeOf(context).height)
                        : BoxConstraints(
                            maxWidth: MediaQuery.sizeOf(context).width,
                            maxHeight: MediaQuery.sizeOf(context).height / 10),
                    child: Text(widget.post.body,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(fontSize: 18),
                        textScaler: TextScaler.linear(
                            ScaleSize.textScaleFactor(context)))),
                isExpanded
                    ? TextButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = false;
                          });
                        },
                        child: const Text('Show less'))
                    : TextButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = true;
                          });
                        },
                        child: const Text('Show more')),
                Text('tags',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    textScaler:
                        TextScaler.linear(ScaleSize.textScaleFactor(context))),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 80,
                ),
                SizedBox(
                    height: MediaQuery.sizeOf(context).height / 23,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.post.tags.length,
                      itemBuilder: (context, index) =>
                          TagContainer(tag: widget.post.tags[index]),
                    )),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 50,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.thumb_up,
                          color: Color(0xffD1D1D3),
                        ),
                        Text(widget.post.reactions.likes.toString()),
                        const Icon(Icons.thumb_down, color: Color(0xffD1D1D3)),
                        Text(widget.post.reactions.dislikes.toString()),
                        const Icon(Icons.remove_red_eye,
                            color: Color(0xffC6C6C7)),
                        Text(widget.post.views.toString())
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
