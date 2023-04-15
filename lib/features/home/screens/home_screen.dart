import 'package:flutter/material.dart';
import 'package:ivykids_assignment/features/home/widgets/widgets.dart';
import 'package:ivykids_assignment/providers/user_provider.dart';
import 'package:ivykids_assignment/utils/utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
          centerTitle: true,
        ),
        body: Center(
          child: Consumer<UserProvider>(
            builder: (context, data, child) {
              return ListView.builder(
                itemCount: data.user.contacts.length,
                itemBuilder: (context, index) {
                  if (data.user.contacts.isEmpty) {
                    return const Center(
                      child: Text('No Contacts have been added'),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Center(
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          title: Text(data.user.contacts[index].name!),
                          subtitle: Text(data.user.contacts[index].email!),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.add),
            onPressed: () {
              showModalSheet(context,FormWidget());
            },
            label: const Text('Add Contact')),
      ),
    );
  }
}
