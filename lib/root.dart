import 'package:flutter/material.dart';
import 'package:vatsalya2/homescreen.dart';
import 'package:vatsalya2/signup.dart';
import 'package:vatsalya2/auth.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;
  @override
  _RootPageState createState() => _RootPageState();
}



enum AuthStatus {
  signedin,
  notsignedin
}
class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notsignedin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        authStatus  = userId == null? AuthStatus.notsignedin : AuthStatus.signedin;
      });
    }
    );
  }

  void signedIn()
  {
    setState(() {
      authStatus = AuthStatus.signedin;
    });
  }
  void signedOut()
  {
    setState(() {
      authStatus = AuthStatus.notsignedin;
    });
  }


  @override
  Widget build(BuildContext context) {
    switch(authStatus)
    {
      case AuthStatus.notsignedin:
        return new SignUp(
          auth : widget.auth,
          onSignedin: signedIn ,
        );
      case AuthStatus.signedin:
        return new HomeScreen(
          auth: widget.auth,
          onsignedout: signedOut,
        );

    };

  }
}