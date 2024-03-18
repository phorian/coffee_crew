import 'package:coffee_crew/models/user.dart';
import 'package:coffee_crew/screens/auth/auth.dart';
import 'package:coffee_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel?>(context);

    //return home or auth
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
