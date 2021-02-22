import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text("Hello and a warm welcome!" , style: TextStyle(fontSize: 25),),
            SizedBox(
              height: 30,
            ),
            Text("Caring for you and your children is essential for your overall wellbeing and a happy life. Here at our Multi-Specialty Pediatrics & Gynecology Center we provide you with the best possible care and comfort each and every time you visit. We offer the latest tested treatments and state-of-the-art equipment to ensure a safe and comfortable experience for our patients. We provide you a well-equipped clinic with all the modern equipment. The clinic has separate waiting and consultation areas which allow enough space for patients to wait conveniently at the clinic.", style: TextStyle(fontSize: 15),),
            SizedBox(
              height: 20,
            ),
            Text("We are Best Pediatric Doctor in Gurugram. Vatsalya Child Care & Surgical Centre is located at the center of the city. There is no dearth of public modes of transport to reach the clinic from all major areas of the city.", style: TextStyle(fontSize: 15),),
            SizedBox(
              height: 20,
            ),
            Text("It is now for everyone to have the healthy life that they always wished. Some Prominent services & features are:", style: TextStyle(fontSize: 15),),
            SizedBox(
              height: 20,
            ),
            Text("- General Pediatrics                                      ", style: TextStyle(fontSize: 15),),
            Text("- Gynecological Procedures                        ", style: TextStyle(fontSize: 15),),
            Text("- Immunization / Vaccination                     ", style: TextStyle(fontSize: 15),),
            Text("- Delivery Procedures                                   ", style: TextStyle(fontSize: 15),),
            Text("- Developmental Pediatrics                         ", style: TextStyle(fontSize: 15),),
            Text("- Women's Health                                          ", style: TextStyle(fontSize: 15),),
            SizedBox(
              height: 20,
            ),
            Text("Visit Our Website for more information!", style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 50,
            ),
            Text("Terms and Conditions" , style: TextStyle(fontSize: 25),),
            SizedBox(
              height: 30,
            ),
            Text("Thank you for choosing Vatsalya Child Care & Surgical Centre.", style: TextStyle(fontSize: 15),),
            SizedBox(
              height: 30,
            ),
            Text("We are always pleased to assist our clients whenever we can. This document gives details of our terms and conditions of service. If, however, you have any queries or need clarification, please contact us and a member of staff will be happy to help you.", style: TextStyle(fontSize: 15),),
            SizedBox(
              height: 30,
            ),
            Text("A) Vatsalya Child Care & Surgical Centre does not have a contract with a Government agency and as such treatment is provided on a private basis.", style: TextStyle(fontSize: 15),),
            SizedBox(
              height: 30,
            ),
            Text("B) Treatment estimates: Once your treatment plan has been agreed with the dentist, we will provide details of your plan. Treatment plans are valid for 30 days from examination.", style: TextStyle(fontSize: 15),),
            SizedBox(
              height: 30,
            ),
            Text("C) Consent forms: Certain treatments require completion of a consent form. We will explain the treatment, after-care and any risk to you thoroughly.", style: TextStyle(fontSize: 15),),
            SizedBox(
              height: 30,
            ),
            Text("D) Personal Details: It is very important that you give a full medical history and details of any medication you take. Should these change in anyway it is important you tell the doctor and give current information.", style: TextStyle(fontSize: 15),),






          ],
        ),
      )

    );
  }
}