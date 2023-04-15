import 'package:flutter/material.dart';
import 'package:ivykids_assignment/providers/user_provider.dart';
import 'package:provider/provider.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

void showModalSheet(BuildContext context, Widget widget) {
  final size = MediaQuery.of(context).size;
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(13.0),
        child: widget,
      );
      // return StatefulBuilder(
      //     builder: (BuildContext context, StateSetter setState) {
      //   bool _isLoading = false;
      //   return Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: widget,
      //   );
      // });
    },
  );
}
