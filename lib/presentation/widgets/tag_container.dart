import 'package:flutter/material.dart';

class TagContainer extends StatelessWidget {
  final String tag;
  const TagContainer({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: MediaQuery.sizeOf(context).height / 23,
        width: MediaQuery.sizeOf(context).width / 5,
        decoration: BoxDecoration(
            color: const Color(0xFFc0cfd9),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(50)),
        child: Center(
            child: Text(
              tag,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    );
  }
}
