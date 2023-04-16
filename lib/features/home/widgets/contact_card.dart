import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final Function onDelete;
  final Function onEdit;

  const ContactCard({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(widget.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.email),
            const SizedBox(height: 4.0),
            Text(widget.phone),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => widget.onEdit(),
              // onPressed: () => (){},
            ),
            IconButton(
              icon: _isLoading ?const Center(child: CircularProgressIndicator(),): const Icon(Icons.delete),
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                await widget.onDelete();
                setState(() {
                  _isLoading = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
