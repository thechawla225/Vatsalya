import 'package:flutter/material.dart';
import 'package:vatsalya2/patientform.dart';
import 'patient.dart';
import 'patientform2.dart';

enum SingingCharacter { p, n }


class ChooseDoctor extends StatefulWidget {
  @override
  _ChooseDoctorState createState() => _ChooseDoctorState();
}

class _ChooseDoctorState extends State<ChooseDoctor> {
  Food food;
  SingingCharacter character = SingingCharacter.p;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Take An Appointment'),
        ),

        body: Column(
          children: <Widget>[

            RadioListTile<SingingCharacter>(
              title: const Text("Dr.Puneet Madan MBBS, MD (Child Specialist)", style: TextStyle(fontSize: 25),),
              value: SingingCharacter.p,
              groupValue: character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  character = value;
                });
              },
            ),
            SizedBox(
                height: 30
            ),
            SizedBox(height : 30),

            RadioListTile<SingingCharacter>(
              title: const Text("Dr.Namrata Madan MBBS,MS (General Surgeon)", style: TextStyle(fontSize: 25),),
              value: SingingCharacter.n,
              groupValue: character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  character = value;
                });
              },
            ),
            SizedBox(
                height: 30
            ),
            RaisedButton(
                child: Text("OK", style: TextStyle(color: Colors.white)),
                color: Colors.green,
                onPressed: (){
                  if(character == SingingCharacter.n)
                  {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (_)=>PatientForm(),
                    )
                    );
                  };
                  if(character == SingingCharacter.p) {

                    Navigator.push(context, MaterialPageRoute(
                      builder: (_)=>PatientForm2(),
                    )
                    );

                  };

                }

            )
          ],

        ),
      ),
    );
  }
}