import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class login_page extends StatefulWidget {
  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _Login() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  _Logout() async {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Google Sign In",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
          child: _isLoggedIn
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      _googleSignIn.currentUser.photoUrl,
                      height: 300.0,
                      width: 300.0,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(_googleSignIn.currentUser.displayName),
                    SizedBox(
                      height: 20,
                    ),
                    Text(_googleSignIn.currentUser.email),
                    SizedBox(
                      height: 100,
                    ),
                    OutlineButton(
                        color: Colors.blue,
                        child: Text('Logout'),
                        onPressed: () {
                          _Logout();
                        }),
                  ],
                )
              : OutlineButton(
                  color: Colors.red,
                  child: Text('Login with Google'),
                  onPressed: () {
                    _Login();
                  },
                )),
    );
  }
}
