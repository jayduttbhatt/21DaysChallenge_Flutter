import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tcube/home.dart';
import 'userprofile.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new LoginPage(),
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            primarySwatch: Colors.blue
        )
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async{
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Sign In'),
    ));
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    AuthResult userDetails = await _firebaseAuth.signInWithCredential(credential);
    //ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);
    List<ProviderDetails> providerData = new List<ProviderDetails>();
    //providerData.add(providerInfo);

    UserDetails details;
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => ProfileScreen(detailsUser: details)
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Builder(
        builder: (context) => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image(image: new AssetImage("Transportfacility.jpg"),
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(15.0, 105.0, 90.0, 0),
                            child: Text("Hello" , style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.blueGrey, ),
                            ),),
                          Container(
                            padding: EdgeInsets.fromLTRB(15.0, 175.0, 90.0, 0),
                            child: Text("There" , style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.blueGrey, ),
                            ),),
                          Container(
                            padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                            child: Text("." , style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.green[300], ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(25.0, 280.0, 0.0, 0.0),
                            child: Text('''We all know that waiting for the buses is soo terrible.
We also that how their delays can actually ruin our moods,
but now is the time to find out the solution that could combat the above situations.
Needless to say, mobile apps are the only medium that can help us to get rid of the above problems,
the reason being they are now engineered in quite a capable form.''' ,
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey, fontFamily: "Montserrat"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: new Form(
                        key: _formKey,
                        child: new Container(
                          padding: const EdgeInsets.all(10.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                ),
                                color: Colors.blueGrey,
                                textColor: Colors.white,
                                onPressed: ()=> _signIn(context).then((FirebaseUser user)=> print(user)).catchError((e)=> print(e)),
                                child: new Text("Sign Up with Gmail", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white70),),
                                padding: EdgeInsets.fromLTRB(90.0, 15.0, 80.0, 15.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();

      AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user,)));

    }
  }
}

class UserDetails{
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;
  UserDetails(this.providerDetails, this.userName, this.photoUrl, this.userEmail, this.providerData);

}

class ProviderDetails {
  ProviderDetails(this.providerDetails);

  final String providerDetails;
}