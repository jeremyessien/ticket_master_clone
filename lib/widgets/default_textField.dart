import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final double? height;
  const DefaultTextField({Key? key, this.title, this.hintText, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
        ),
        SizedBox(
          height: height,
          child: TextField(
            decoration: InputDecoration(
                hintText: hintText, border: const OutlineInputBorder()),
          ),
        ),
        const SizedBox(height: 15,),
      ],
    );
  }
}
