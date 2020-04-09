import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'complain.dart';
import 'main.dart';
import 'maps.dart';
// ignore: camel_case_types
class feedback extends StatefulWidget {
  @override
  _feedbackState createState() => _feedbackState();
}

// ignore: camel_case_types
class _feedbackState extends State<feedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provide Your Feedback"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          margin: EdgeInsets.all(10.0),
          child: new Column(
              children: <Widget>[
                new Text(
                    "FeedBacks are Apprieciated",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                new TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: "Enter Your Feedback Here",
                  border: OutlineInputBorder(
                  ),
                ),
              ),
                new Padding(
                    padding: const EdgeInsets.only(top: 20.0)
                ),
                new RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  color: Colors.blueGrey[900],
                  textColor: Colors.white,
                  onPressed: toast,
                  child: new Text("Submit Feedback"),
                  padding: EdgeInsets.fromLTRB(80.0, 15.0, 80.0, 15.0),
                ),
              ],
            ),
        ),
      ),
      drawer: Drawer(
        child: Container( color: Colors.blueGrey[900],
          child: ListView(
            children: <Widget>[
              new ListTile(
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
  // ignore: missing_return
  void toast() {
    Fluttertoast.showToast(msg: "Feedback Successfully Submit",
        fontSize: 20.0,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey);
  }
}
