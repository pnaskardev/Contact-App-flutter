import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget 
{
  final _formKey = GlobalKey<FormState>();

  FormWidget({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Form
    (
      key: _formKey,
      child: Column
      (
        children: 
        [
          TextFormField
          (
            decoration: const InputDecoration
            (
              labelText: 'Name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Phone',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
          ElevatedButton.icon
          (
            onPressed: ()
            {
              if (_formKey.currentState!.validate()) 
              {
                ScaffoldMessenger.of(context).showSnackBar
                (
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            }, 
            icon: const Icon(Icons.send), 
            label: const Text('Submit')
          )
          // ElevatedButton
          // (
          //   onPressed: () 
          //   {
              // if (_formKey.currentState!.validate()) 
              // {
              //   ScaffoldMessenger.of(context).showSnackBar
              //   (
              //     const SnackBar(content: Text('Processing Data')),
              //   );
              // }
          //   },
          //   child: Text('Submit'),
          // ),
        ],
      ),
    );
  }
}