import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final Function onDelete;
  // final Function onEdit;

  const ContactCard({super.key, 
    required this.name,
    required this.email,
    required this.phone,
    required this.onDelete,
    // required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(email),
            const SizedBox(height: 4.0),
            Text(phone),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              // onPressed: () => onEdit(),
              onPressed: () => (){},
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => onDelete(),
            ),
          ],
        ),
      ),
    );
  }
}
