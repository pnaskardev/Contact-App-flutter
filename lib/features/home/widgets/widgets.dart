import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ivykids_assignment/model/contact.dart';
import 'package:ivykids_assignment/utils/string_validator.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key, this.contact, required this.onSave});
  final Contacts? contact;
  final Function(Contacts) onSave;
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  var _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  late var _usernameController = TextEditingController();
  late var _phoneController = TextEditingController();
  late var _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.contact != null) {
      _usernameController =
          TextEditingController(text: widget.contact?.name ?? '');
      _emailController =
          TextEditingController(text: widget.contact?.email ?? '');
      _phoneController =
          TextEditingController(text: widget.contact?.phone ?? '');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _handleSave() async 
    {
      // Create a new contact object with the updated data
      try {
        final contact = Contacts(
          name: _usernameController.text.trim(),
          email: _emailController.text.trim(),
          phone: _phoneController.text.trim(),
        );

        // Call the onSave callback to save the contact
        await widget.onSave(contact);
      } catch (e) {
        log(e.toString());
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: 
        [
           Text(
            widget.contact!=null ? 'Edit Contact':'Add Contact',
            style:const  TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  label: const Text('Name'),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.red,
                      )),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true),
              keyboardType: TextInputType.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  label: const Text('Email'),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.red,
                      )),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true),
              validator: (value) {
                if (!StringValidator.validateEmail(value!)) {
                  return 'Invalid Email ';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _phoneController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  label: const Text('Phone'),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.red,
                      )),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true),
              validator: (value) {
                if (!StringValidator.validatePhone(value!)) {
                  return 'Invalid Phone Number';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
            ),
          ),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox
              (
                height: MediaQuery.of(context).size.height*0.08,
                width: MediaQuery.of(context).size.width*0.5,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ElevatedButton.icon(
                
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            setState(() {
                              _isLoading = true;
                            });
                            await _handleSave();
                            setState(() {
                              _isLoading = false;
                            });
                            Navigator.of(context).pop();
                          } catch (e) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          }
                        }
                      },
                      icon: Icon(widget.contact == null ? Icons.add : Icons.edit),
                      label:
                          Text(widget.contact == null ? 'Add Contact' : 'Update')),
                ),
              )
        ],
      ),
    );
  }
}
