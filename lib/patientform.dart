import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vatsalya2/patient.dart';
import 'package:vatsalya2/foodnotifier.dart';
import 'package:provider/provider.dart';
import 'package:vatsalya2/food_api.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class PatientForm extends StatefulWidget {
  @override
  _PatientFormState createState() => _PatientFormState();
}



class _PatientFormState extends State<PatientForm> {
  String _string;
  launchWhatsApp(namee,agee,string1,isonlinee) async {
    var text1 = "Hello Doctor Namrata! I would like to request an appointment for $namee ($_currentgender) who is $agee years old, on the $string1 in the time slot $_currenttime ";
    var text2 = "Hello Doctor Namrata! I would like to request an *ONLINE* appointment for $namee ($_currentgender) who is $agee years old, on the $string1 in the time slot $_currenttime ";
    print(isonlinee);
    final link1 = WhatsAppUnilink(
      phoneNumber: '+91-9911447240',
      text: text1,
    );
    final link2 = WhatsAppUnilink(
      phoneNumber: '+91-9911447240',
      text: text2,
    );
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
    if(isonlinee == "Online appointment")
    {
    await launch('$link2');
    }
    else
      {
        await launch('$link2');
      }
  }

  final formkey2 = new GlobalKey<FormState>();
  Food _currentFood;

  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _string = dateFormat.format(selectedDate);
      });
  }


  var _days = ["Monday", "Tuesday", "Wednesday" , "Thursday" , "Friday"];
  var _currentday = DateFormat('EEEE').format(DateTime.now());
  var _genders = ["Male" , "Female"];
  var _currentgender = "Male";
  var online = ["Online appointment", "Walk in appointment"];
  var isonline = "Walk in appointment";
  var _times = ["9am - 1pm" , "6pm - 7:30pm (By appointment)" , "Sunday : 11am - 12:30pm (By appointment)" ];
  var _currenttime = "9am - 1pm";
  var _age;
  var _name;



  @override
  void initState() {
    super.initState();
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);
    if (foodNotifier.currentFood != null) {
      _currentFood = foodNotifier.currentFood;
    } else {
      _currentFood = Food();
    }
  }
  _saveFood() {
    print('saveFood Called');
    if (!formkey2.currentState.validate()) {
      return;
    }

    formkey2.currentState.save();

    print('form saved');


    uploadFood(_currentFood,  _onFoodUploaded);


  }

  _onFoodUploaded(Food food) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);
    foodNotifier.addFood(food);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Enter Patient Details"),
        ),
        body: SingleChildScrollView(
          child:
          Center(
            child: Form(
              key: formkey2,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) => value.isEmpty ? "Name Cannot be empty" : null,
                    onSaved: (value){
                      _name = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter the name of the Patient",
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) => value.isEmpty ? "Age Cannot be empty" : null,
                    onSaved: (value){
                      _age = value;
                        },
                    decoration: InputDecoration(
                      hintText: "Enter the age of the Patient",
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),

                  SizedBox(
                      height :10
                  ),
                  Text("Select Gender", style: TextStyle(fontSize: 20.0, color: Colors.black),),
                  DropdownButton<String>(
                    isExpanded: true,
                    items: _genders.map((String dropDownStringItem){
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }
                    ).toList(),
                    onChanged: (String value){
                      this._currentgender = value;
                      setState(() {
                        _currentgender;
                        _currentFood.gender = this._currentgender;
                      });
                    },
                    value: this._currentgender,
                  ),
                  SizedBox(
                      height :10
                  ),
                  Text("Select Appointment type (Online appointment fees: Rs.500 to be paid before appointment time)", style: TextStyle(fontSize: 20.0, color: Colors.black),),
                  DropdownButton<String>(
                    isExpanded: true,
                    items: online.map((String dropDownStringItem){
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }
                    ).toList(),
                    onChanged: (String value){
                      this.isonline = value;
                      setState(() {
                        isonline = value;
                        ;
                      });
                    },
                    value: this.isonline,
                  ),
                  SizedBox(
                      height :10
                  ),
                  Text("Select Date", style: TextStyle(fontSize: 20.0, color: Colors.black),),
                  IconButton(
                    color: Colors.green,
                    icon: Icon(Icons.calendar_today,size: 35,),
                    onPressed: (){
                      selectDate(context);
                    },
                  ),
                  SizedBox(
                      height :10
                  ),
                  Text("Select Time Slot (Select Sunday time for Sundays)", style: TextStyle(fontSize: 20.0, color: Colors.black),),
                  DropdownButton<String>(
                    isExpanded: true,
                    items: _times.map((String dropDownStringItem){
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }
                    ).toList(),
                    onChanged: (String value){
                      this._currenttime = value;
                      setState(() {
                        _currenttime;
                        _currentFood.time = this._currenttime;

                      });
                    },
                    value: this._currenttime,
                  ),
                  SizedBox(
                      height :30
                  ),
                  RaisedButton(
                    color: Colors.green,
                    child: Text("Request an appointment"),
                    onPressed: ()
                    { formkey2.currentState.save();
                      launchWhatsApp(_name,_age,_string,isonline);
                    },
                  ),
                  SizedBox(
                      height :30
                  ),
                  Text("This button will open Whatsapp to request appointment, you can stop the process at any time"),
                  SizedBox(
                      height :30
                  ),
                Text("Please note that this is not an actual appointment, but only a request for one. We will contact you for a confirmation shortly after.By clicking the <Request an appointment> button you agree to the Terms & Conditions mentioned in the About us section"),

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}