import 'package:flutter/material.dart';
import 'package:ivykids_assignment/utils/utils.dart';

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
    return InkWell(
      onTap: () => showModalSheet(
          context,
          ContactInfoWidget(
            name: widget.name,
            email: widget.email,
            phone: widget.phone,
            onDeletePressed: widget.onDelete,
            onEditPressed: widget.onEdit,
          )),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListTile(
          leading: const Icon(Icons.person),
          title: Text(widget.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => widget.onEdit(),
                // onPressed: () => (){},
              ),
              IconButton(
                icon: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Icon(Icons.delete),
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
      ),
    );
  }
}

class ContactInfoWidget extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  String? imageUrl;
  final Function onEditPressed;
  final Function onDeletePressed;

  ContactInfoWidget({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
    this.imageUrl,
    required this.onEditPressed,
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  State<ContactInfoWidget> createState() => _ContactInfoWidgetState();
}

class _ContactInfoWidgetState extends State<ContactInfoWidget> 
{
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    widget.imageUrl =
        'https://images.pexels.com/photos/16161517/pexels-photo-16161517.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.imageUrl!),
              radius: 30,
            ),
            const SizedBox(height: 16),
            Text(
              widget.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.email,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              widget.phone,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ElevatedButton(
            //       onPressed: () => widget.onEditPressed(),
            //       child: const Text('Edit'),
            //     ),
            //     const SizedBox(width: 16),
            //     isLoading==true ?const CircularProgressIndicator() : ElevatedButton(
            //       onPressed: () async {
            //         setState(() {
            //           isLoading = true;
            //         });
            //         await widget.onDeletePressed();
            //         setState(() {
            //           isLoading = false;
            //         });
            //         Navigator.of(context).pop();
            //       },
            //       style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            //       child:const Text('Delete'),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
