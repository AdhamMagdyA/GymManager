import 'package:flutter/material.dart';
import 'package:gym_project/style/styling.dart';

class InvitationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: new Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFFFFCE2B),
                  size: 22.0,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Invitations",
              style: TextStyle(fontFamily: "assets/fonts/Changa-Bold.ttf", fontSize: 35)
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: "Invite Your Friends ", style: TextStyle(color: Colors.amber,fontSize: 16)),
              ]),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                  
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: Image(
                                    image: AssetImage(
                                        '../../../assets/images/invite.png')),
                        ),
                            ),
                    const SizedBox(height: 20.0),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8.0),
                      child: Text("Your Friend Information", style: TextStyle(fontSize: 18),)),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8.0),
                      child: TextField(
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder:const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.amber),
                        ),
                        hintText: 'Enter your friend name ',
                        fillColor: Colors.white,
                        hintStyle: TextStyle(color: Colors.grey)
                        ),
                        style: TextStyle(color: Colors.white),
    
                      ),
                    ),
    
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8.0),
                      child: TextField(
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder:const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.amber),
                        ),
                        hintText: 'Enter your friend phone number ',
                        fillColor: Colors.white,
                        hintStyle: TextStyle(color: Colors.grey)
                        ),
                        style: TextStyle(color: Colors.white),
    
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    
                    Container(
                      //width: double.infinity,
                      width: MediaQuery.of(context).size.width*0.5,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8.0),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(PadRadius.radius)),
                        color: Colors.amberAccent,
                        child: Text("Send Invitation",style: TextStyle(fontWeight: FontWeight.bold),),
                        onPressed: () =>{},
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}