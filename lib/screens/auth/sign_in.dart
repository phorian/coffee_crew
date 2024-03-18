import 'package:coffee_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  //const SignIn({super.key, required this.toggleView});


  final Function toggleView;
   const SignIn({super.key, required this.toggleView});


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state storage
  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  }
              ),
              SizedBox(height: 20),
              TextFormField(
                  validator: (val) => val!.length < 6 ? 'Password should be 6+ characters long ' : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                }
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[400],
                  ),
                  //color: Colors.pink[400],
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                       dynamic result = await _auth.signInEmailnPwd(email, password);
                        if(result == null) {
                          setState(() {
                            error = 'User does not exist';
                          });
                        }
                      }
                    }
              ),
              const SizedBox(height: 12.0),
              Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),









        /*ElevatedButton(
          child: Text('Sign in anon'),
          onPressed: () async {
            dynamic response = await _auth.signInAnon();
            if (response == null) {
              print('Error signing in');
            } else {
              print('Signed In');
              print(response.uid);
            }
          },
        ),*/
      ),
    );
  }
}
