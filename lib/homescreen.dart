import 'package:url_launcher/url_launcher.dart';
import 'package:vatsalya2/choosedr.dart';
import 'package:vatsalya2/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:vatsalya2/auth.dart';
import 'package:map_launcher/map_launcher.dart';


class HomeScreen extends StatelessWidget {
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed:  () {
        _signOut();
        Navigator.of(context).pop();

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning"),
      content: Text("Are you sure you want to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  HomeScreen({this.auth, this.onsignedout});
  final BaseAuth auth;
  final VoidCallback onsignedout;

  void _signOut()
  async {
    await auth.signOut();
    onsignedout();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SizedBox(
            height: MediaQuery. of(context). size. height,
            width: MediaQuery. of(context). size. width  ,
            child: Carousel(
              images: [
                ExactAssetImage('assets/images/Nam2.jpg'),
                ExactAssetImage('assets/images/hospital2.jpg'),
                ExactAssetImage('assets/images/Alsothis.jpg'),
                ExactAssetImage('assets/images/team2.jpg'),
                ExactAssetImage('assets/images/Hospital1.jpg'),
              ],
            ),
          ),

        ),
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Text("Vatsalya", style: TextStyle(fontFamily: 'Schyler', fontSize: 50),),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 10,),
                      Icon(Icons.location_on, color: Colors.green, size: 40,),
                      SizedBox(width: 10,),
                      Text("Find Us" , style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  onPressed: ()
                  async {
                    if (await MapLauncher.isMapAvailable(
                        MapType.google)) {
                      await MapLauncher.launchMap(
                        mapType: MapType.google,
                        coords: Coords(28.470564, 77.021904),
                        title: "Vatsalya",
                        description: "Best Medical Care facility",
                      );
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Icon(MdiIcons.facebook, color: Colors.blue, size: 40,),
                    SizedBox(width: 10,),
                    Text("Our Facebook" , style: TextStyle(fontSize: 20),),
                  ],
                ),

                onPressed: () async {await canLaunch('https://www.fb.com/vatsalyagurugram')? launch('https://www.fb.com/vatsalyagurugram'):launch('https://www.fb.com/vatsalyagurugram');

                },
              ),

              SizedBox(
                height: 10,
              ),
              MaterialButton(
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Icon(MdiIcons.web, color: Colors.black, size: 40,),
                    SizedBox(width: 10,),
                    Text("Our Website" , style: TextStyle(fontSize: 20),),
                  ],
                ),
                onPressed: (){
                  launch('https://vatsalyachildandsurgicalcare.com/?fbclid=IwAR1LrFHyHwFsnkyuBW5pNp9oYWkPT6cB_003uUIaJwS6mOPlsMnOCF9PAks');
                },
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Icon(MdiIcons.informationOutline, color: Colors.amber, size: 40,),
                    SizedBox(width: 10,),
                    Text("About Us" , style: TextStyle(fontSize: 20),),
                  ],
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_)=>ProfileScreen(),
                  )
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Icon(MdiIcons.logout, color: Colors.red, size: 40,),
                    SizedBox(width: 10,),
                    Text("Logout" , style: TextStyle(fontSize: 20),),
                  ],
                ),
                onPressed: (){
                  showAlertDialog(context);

                },
              ),
              SizedBox(
                height: 10,
              ),


            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.green,
                label: Text("Take appointment"),
                icon: Icon(Icons.add,
                  color: Colors.white,),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) => ChooseDoctor(),
                  )
                  );
                }
          ),
        ),




      ),
    );
  }
}
