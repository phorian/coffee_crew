import 'package:flutter/material.dart';
import 'package:coffee_crew/models/brew_model.dart';


class BrewTile extends StatelessWidget {

  final Brew brew;
  BrewTile({required this.brew, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew.strength],
            //backgroundImage: AssetImage('assets/coffee_icon.jpg'),
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
