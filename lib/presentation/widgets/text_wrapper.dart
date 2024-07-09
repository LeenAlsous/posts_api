import 'package:flutter/material.dart';
import 'package:posts_api/business_logic/models/post_model.dart';
import 'package:posts_api/presentation/widgets/post_container.dart';

class TextWrapper extends StatefulWidget {
  final Post post;
  const TextWrapper({Key? key, required this.post}) : super(key: key);

  @override
  State<TextWrapper> createState() => _TextWrapperState();
}

class _TextWrapperState extends State<TextWrapper> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: isExpanded ? const BoxConstraints() : BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height / 1.5),
          child: PostsContainer(post: widget.post)),
        isExpanded ? TextButton(onPressed: (){setState(() {
          isExpanded = false;
        });}, child: const Text('Show less')) : TextButton(onPressed: (){setState(() {
          isExpanded = true;
        });}, child: const Text('Show more'))
      ],
    );
  }
}
