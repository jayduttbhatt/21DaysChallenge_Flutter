import 'package:flutter/material.dart';

// ignore: camel_case_types
class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

// ignore: camel_case_types
class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('''     Registration Page'''),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: new Form(
        child: new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.brown,
              inputDecorationTheme: new InputDecorationTheme(
                  labelStyle:
                      new TextStyle(color: Colors.white70, fontSize: 20.0))),
          child: new Container(
            margin: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Column(

                        children: <Widget>[
                          new TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ), // icon is 48px widget.
                              ), // icon is 48px widget.
                              hintText: 'First Name',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                          ),
                          new Padding(padding: const EdgeInsets.only(top: 20.0)),
                          new TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ), // icon is 48px widget.
                              ), // icon is 48px widget.
                              hintText: 'Last Name',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                          ),
                          new Padding(padding: const EdgeInsets.only(top: 20.0)),
                          new TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Icon(
                                  Icons.mail,
                                  color: Colors.grey,
                                ), // icon is 48px widget.
                              ), // icon is 48px widget.
                              hintText: 'Email',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                          ),
                          new Padding(padding: const EdgeInsets.only(top: 20.0)),
                          new TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                ), // icon is 48px widget.
                              ), // icon is 48px widget.
                              hintText: 'Contact',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                          ),
                          new Padding(padding: const EdgeInsets.only(top: 20.0)),
                          new TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ), // icon is 48px widget.
                              ), // icon is 48px widget.
                              hintText: 'Password',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                            obscureText: true,
                          ),
                          new Padding(padding: const EdgeInsets.only(top: 20.0)),
                          new TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ), // icon is 48px widget.
                              ), // icon is 48px widget.
                              hintText: 'Confirm Password',
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                            obscureText: true,
                          ),
                          new Padding(padding: const EdgeInsets.only(top: 20.0)),
                          new MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                            ),
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: () {},
                            child: new Text("Submit"),
                            padding: EdgeInsets.fromLTRB(
                                130.0, 15.0, 130.0, 15.0),
                          ),
                        ]
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
