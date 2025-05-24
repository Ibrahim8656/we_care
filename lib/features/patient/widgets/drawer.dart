import 'package:flutter/material.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';

class drawer extends StatelessWidget {
  const drawer({
    super.key,required this.patient,
  });
final PatientEntitiy? patient;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/person.jpg'),
              ),
              SizedBox(height: 15,),
                Text(patient!.name, style: TextStyle(color:Colors.white, fontSize: 25),),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title:  Text(patient!.phone),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.archive),
            title: const Text('archive'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          SizedBox(height: 20,),
            ListTile(
            leading: Icon(Icons.settings),
            title: const Text('settings'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
