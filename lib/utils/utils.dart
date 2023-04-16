import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

void showModalSheet(BuildContext context, Widget widget) {
  showModalBottomSheet
  (
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          // padding: const EdgeInsets.all(13.0),
          padding: EdgeInsets.only(top:16.0,left: 25.0,right: 25.0 ,bottom: MediaQuery.of(context).viewInsets.bottom),
          child: widget,
        ),
      );
    },
  );
}

void showAlertDialog(BuildContext context)
{
  AlertDialog alert=const AlertDialog(
    content:   Center(child: CircularProgressIndicator()),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}
