import 'package:demo_views/demo_views.dart';
import 'package:flutter/material.dart';

class ContactDetail extends StatelessWidget {
  final PersonalContact contact;
  const ContactDetail({super.key,required this.contact});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
      ),
      body: Contact(personalContact: contact),
    );
  }
}