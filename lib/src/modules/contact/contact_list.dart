import 'package:angular_emulation/src/core/providers.dart';
import 'package:angular_emulation/src/modules/contact/contact_detail.dart';
import 'package:angular_emulation/src/services/contact_service.dart';
import 'package:demo_views/demo_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactList extends ConsumerWidget {
  
  final List<PersonalContact> contacts = <PersonalContact>[];
  ContactList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final ContactService contactService = ref.watch(contactServiceProvider);
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<PersonalContact>>(
          future: contactService.getContacts(),
          builder: (context, snapshot) {
            contacts.clear();
            if ((snapshot.hasData) && (snapshot.connectionState == ConnectionState.done)){
              contacts.addAll(snapshot.data as List<PersonalContact>);
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ContactDetail(contact: contacts[index])));
                    },
                    title: Text(contacts[index].name),
                    leading: const Icon(Icons.person),
                  );
                }
              );
            } else{
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}