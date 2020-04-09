import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'feedback.dart';
import 'complain.dart';
import 'main.dart';
// ignore: camel_case_types
class maps extends StatefulWidget {
  @override
  _mapsState createState() => _mapsState();
}
// ignore: camel_case_types
class _mapsState extends State<maps> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(22.310696,  73.192635);
  final Set<Marker> _marker = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position){
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              mapType: _currentMapType,
              markers: _marker,
              onCameraMove: _onCameraMove,
            ),
          ],
        ),
        drawer:  Drawer(
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
