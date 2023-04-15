import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

void showModalSheet(BuildContext context, Widget widget) {
  final size = MediaQuery.of(context).size;
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      // return SizedBox
      // (
      //   height: size.height*0.6,
      //   child:const Center
      //   (
      //     child: Text('This is a modal bottom sheet'),
      //   ),
      // );
      return Padding(
        padding: const EdgeInsets.all(13.0),
        child: widget,
      );
    },
  );
}
