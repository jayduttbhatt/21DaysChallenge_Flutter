import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tcube/main.dart';
import 'feedback.dart';
import 'complain.dart';
import 'main.dart';
import 'maps.dart';

  class Home extends StatefulWidget {
    Home({
      Key key,
      @required this.user}) : super(key: key);
    final AuthResult user;
    @override
    _HomeState createState() => _HomeState();
  }

  class _HomeState extends State<Home> {
    @override
    Widget build(BuildContext context) {
        return Container(
          child: Drawer(
                      child: ListView(
                        children: <Widget>[
                           new UserAccountsDrawerHeader(
                              margin: EdgeInsets.only(bottom: 20.0,),
                              decoration: new BoxDecoration(
                              color: Colors.black54,
                               image: DecorationImage(
                               fit: BoxFit.fill,
                               colorFilter: ColorFilter.linearToSrgbGamma(),
                               image:  AssetImage('Transportfacility.jpg'),
                        )
                            ),
                            currentAccountPicture: CircleAvatar(
                                foregroundColor: Colors.white,
                                backgroundImage: AssetImage("assets/logo_tcube.png")
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.map),
                            title: Text('Map'),
                            onTap: (){
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => maps()));
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.supervised_user_circle),
                            title: Text('User'),
                            onTap: (){
                              Navigator.of(context).pop();
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => skills()));
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.settings),
                            title: Text('Account Settings'),
                            onTap: (){
                              Navigator.of(context).pop();
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => skills()));
                            },
                          ),
                          ListTile(

                            title: Text('Feedback'),
                            leading: Icon(Icons.feedback),
                            onTap: (){
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => feedback()));
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.block),
                            title: Text('complain'),
                            onTap: (){
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => complain()));
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.power_settings_new),
                            title: Text('Log out'),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  ),
                ],
                      ),
          ),
        );
    }
  }
