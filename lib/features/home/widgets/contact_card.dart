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
        elevation: 5.0,
        margin: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: 
          [
            
            ListTile(
              leading: CircleAvatar(
              child: Text(widget.name.substring(0, 1)),
            ),
              title: Text(widget.name,overflow: TextOverflow.ellipsis,),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit,color: Colors.deepPurpleAccent,),
                    onPressed: () => widget.onEdit(),
                  ),
                  IconButton(
                    icon: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const Icon(Icons.delete,color: Colors.red,),
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
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: SizedBox
              (
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('email: ${widget.email}',overflow: TextOverflow.ellipsis,),
                  ],
                )
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: SizedBox
                         (
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('phone: ${widget.phone}',overflow: TextOverflow.ellipsis,),
                  ],
                )
                         ),
             ),
          ],
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              child:Text(widget.name.substring(0, 1)),
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
          ],
        ),
      ),
    );
  }
}
