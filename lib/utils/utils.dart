import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void showSnackBar(BuildContext context, String text,bool success) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text),backgroundColor: success?Colors.green:Colors.redAccent,));
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


pickImage(ImageSource source) async 
{
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);

  if (file != null) {
    return await file.readAsBytes();
  }
  log('No Image selected');
}