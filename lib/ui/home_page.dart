import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    super.initState();

    Contact contact = Contact();
    contact.name = 'Lud';
    contact.email = 'lude@email.com';
    contact.phone = '887788';
    contact.image = 'c/ww';

    helper.saveContact(contact);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
