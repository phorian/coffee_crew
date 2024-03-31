import 'package:coffee_crew/global/loading.dart';
import 'package:coffee_crew/models/user.dart';
import 'package:coffee_crew/services/db.dart';
import 'package:flutter/material.dart';
import 'package:coffee_crew/global/constant.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel?>(context);

    return StreamBuilder<UserData>(
      stream: DbServices(uid: user?.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserData? userData = snapshot.data;
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                'Update your brew settings.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                initialValue: userData?.name,
                decoration: textInputDecoration,
                validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) => setState(() => _currentName = val)
              ),
              SizedBox(height: 20.0),
        
              //dropdown
              DropdownButtonFormField(
                decoration: textInputDecoration,
                  value: _currentSugars ?? userData?.sugars,
                  items: sugars.map((sugar){
                    return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar sugars')
                    );
        
                  }).toList(),
                  onChanged: (val) => setState(() => _currentSugars = val)
              ),
              SizedBox(height: 20.0),
              //slider
              Slider(
                  min: 100,
                  max: 900,
                  divisions: 8,
                  value: (_currentStrength ?? userData?.strength)!.toDouble(),
                  activeColor: Colors.brown[_currentStrength ?? userData!.strength!],
                  inactiveColor: Colors.brown[_currentStrength ?? userData!.strength!],
                  onChanged: (val) => setState(() => _currentStrength = val.round()),
              ),
        
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[400],
                ),
                child: Text(
                  'update',
                  style: TextStyle(color: Colors.white),
                ),
                  onPressed: () async {
                      if(_formKey.currentState!.validate()) {
                        await DbServices(uid: user?.uid).updateUserData(
                            _currentName ?? userData!.name!,
                            _currentSugars ?? userData!.sugars!,
                            _currentStrength ?? userData!.strength!
                        );
                        Navigator.pop(context);
                      }
                  }
              )
            ],
          ),
        
        );
        }else {
          return Loading();
        }
      }
    );
  }
}
