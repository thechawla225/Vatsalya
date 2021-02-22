import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatsalya2/auth.dart';


class SignUp extends StatefulWidget {
  SignUp({this.auth , this.onSignedin});
  final BaseAuth auth;
  final VoidCallback onSignedin;
  @override
  _SignUpState createState() => _SignUpState();
}

enum FormType {
  login,
  register,
}
class Errors {
  static String show(String errorCode) {
    switch (errorCode) {
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return "This e-mail address is already in use, please use a different e-mail address.";

      case 'ERROR_INVALID_EMAIL':
        return "The email address is badly formatted.";

      case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
        return "The e-mail address in your Facebook account has been registered in the system before. Please login by trying other methods with this e-mail address.";

      case 'ERROR_WRONG_PASSWORD':
        return "E-mail address or password is incorrect.";

      default:
        return "An error has occurred";
    }
  }
}
class _SignUpState extends State<SignUp> {
  var err;
  final formkey = new GlobalKey<FormState>();
  String _email;
  String _password;
  FormType _formType = FormType.register;



  void movetologin()
  {
    formkey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }
  void movetoregister()
  {
    formkey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }
  bool validateandsave()
  {
    final form = formkey.currentState;
    form.save();
    if(form.validate()){
      return true;
    }
    else {
      return false;
    }

  }


  void validateandsubmit()

  async {
    if(validateandsave())
    {
      if(_formType == FormType.login)
      {
        try{
        String userId = await widget.auth.SignInWithEmailAndPassword(_email, _password);
        print("Logged in as $userId");
      }
      catch(e){
        print(Errors.show(e.code));
        err = e.code;

        }
      }
      else {
        String userId = await widget.auth.CreateUserWithEmailAndPassword(_email, _password);
        print("Signed in as $userId");
      }
      widget.onSignedin();
    }
  }

  void onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              new CircularProgressIndicator(),
              new Text("Just a second"),
            ],
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 4), () {
      validateandsubmit();
      Navigator.pop(context); //pop dialog
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                SizedBox(
                  height: (MediaQuery. of(context). size. height)/4,
                ),
                Center(
                  child:
                  Text("Welcome !", style: TextStyle(color: Colors.white , fontSize: 55,fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text("Signup or Login" , style: TextStyle(color: Colors.black , fontSize: 30)),
                ),
                SizedBox(
                  height: 30,
                ),
                Form
                  (
                  key: formkey,
                  child: Column(children: buildinput() + buildbuttons()),
                ),


              ]
          ),
        ),
      ),
    );
  }
  List<Widget> buildinput() {
    return [
      TextFormField(
        validator: (value) {
          if(value.isEmpty)
          {return "Email cannot be empty";
          }

          else

          {
            return null;
          }

        },
        onSaved: (value){
          _email = value;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail, color: Colors.white,),
          hintText: "Enter Email ",
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
      TextFormField(
        onSaved: (value){
          _password = value;
        },
        validator: (value) {
          if(value.isEmpty)
            {return "Password cannot be empty";}
          else
            {
              return null;
            }

        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key, color: Colors.white,),
          hintText: "Enter Password",
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),

        ),
        obscureText: true,
      ),
    ];
  }
  List<Widget> buildbuttons()
  {
    if(_formType == FormType.register){
      return [
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          child: Text("Sign Up"),
          color: Colors.lightGreen,
          onPressed: () {onLoading();},
        ),
        RaisedButton(
          child: Text("Already have an account? Login"),
          color: Colors.lightGreen,
          onPressed: movetologin,
        ),
      ];
    }
    else
    {
      return [
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          child: Text("Login"),
          color: Colors.lightGreen,
          onPressed: (){
            onLoading();
          },
        ),
        RaisedButton(
          child: Text("Don't have an account? SignUp"),
          color: Colors.lightGreen,
          onPressed: movetoregister,
        ),
      ];
    }
  }
}