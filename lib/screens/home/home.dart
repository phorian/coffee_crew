import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee_crew/services/db.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
      Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      initialData: null,
      value: DbServices().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Coffee Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign out'),
                onPressed: () async {
                await _auth.SignOut();
                },
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
