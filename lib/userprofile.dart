import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'feedback.dart';
import 'complain.dart';
import 'maps.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
class ProfileScreen extends StatelessWidget {
  final UserDetails detailsUser;

  ProfileScreen({Key key, @required this.detailsUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoogleSignIn _gSignIn = GoogleSignIn();

    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        child: Container(
          color: Colors.blueGrey[900],
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.map,color: Colors.grey,),
                title: Text('Map', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.grey),),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => maps()));
                },
              ),
              SizedBox(height: 15.0,),
              ListTile(
                leading: Icon(Icons.supervised_user_circle,color: Colors.grey,),
                title: Text('User', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.grey),),
                onTap: (){
                  Navigator.of(context).pop();
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => skills()));
                },
              ),
              SizedBox(height: 15.0,),
              ListTile(
                title: Text('Feedback', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.grey),),
                leading: Icon(Icons.feedback,color: Colors.grey,),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => feedback()));
                },
              ),
              SizedBox(height: 15.0,),
              ListTile(
                leading: Icon(Icons.block,color: Colors.grey,),
                title: Text('complain', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.grey),),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => complain()));
                },
              ),
              SizedBox(height: 15.0,),
              ListTile(
                leading: Icon(Icons.power_settings_new,color: Colors.grey,),
                title: Text('Log out', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.grey),),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}