import 'package:flutter/material.dart';

class TagContainer extends StatelessWidget {
  const TagContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: MediaQuery.sizeOf(context).height / 23,
        width: MediaQuery.sizeOf(context).width / 5,
        decoration: BoxDecoration(
            color: const Color(0xFFcaa49f),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(50)),
        child: const Center(
            child: Text(
              'tag',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    );
  }
}
