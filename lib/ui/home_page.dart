import 'dart:io';

import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  List<Contact> contacts = List();

  @override
  void initState() {
    super.initState();
    helper.getAllContacts().then((list) {
      setState(() {
        contacts = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
        backgroundColor: Color(0xff4dd0e1),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Color(0xff4dd0e1)),
      body: ListView.builder(
        itemBuilder: (context, index) {

        },
        itemCount: contacts.length,
        padding: EdgeInsets.all(10),
      ),
    );
  }

  Widget _contatctCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: contacts[index].image != null ? FileImage(
                            File(contacts[index].image)) : AssetImage(
                            'images/icon-person.png')
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(contacts[index].name ?? '', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text(contacts[index].email ?? '', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text(contacts[index].phone ?? '', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
