import 'package:flutter/material.dart';
import 'package:gym_project/screens/admin/crowd_meter.dart';

class BranchDetails extends StatefulWidget {
  const BranchDetails({ Key key }) : super(key: key);

  @override
  _BranchDetailsState createState() => _BranchDetailsState();
}

class _BranchDetailsState extends State<BranchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                child:Image.asset(
                      'assets/images/branch.jfif',
                      fit: BoxFit.cover, 
                    ),
                height: MediaQuery.of(context).size.height*0.3,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10),
                      child: Text("Maadi Branch", style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'assets/fonts/Changa-Bold.ttf',
                      ),),
                  ),  
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text("Call us: 0101111002" , style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.amber,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'assets/fonts/Changa-Bold.ttf',
                          ),),
                        ),
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text("25 Orabi street, Maadi Cairo" , style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'assets/fonts/Changa-Bold.ttf',
                          ),),
                        ),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Text("250 seats", style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        ))
                      ],
                    ),
                    padding:EdgeInsets.symmetric(horizontal: 20.0,vertical: 7),
                  ),
                ],
              crossAxisAlignment: CrossAxisAlignment.start,

              ),
              Row(
                children: [
                  Flexible(
                    child: Card(
                      color: Colors.white12,
                      child: ListTile(
                        title: Text("Coches", style: TextStyle(
                          color: Colors.amber,
                          fontSize: 14.0,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                          ),
                          textAlign: TextAlign.center, 
                        ),
                        subtitle: Text("50", style: TextStyle(
                          color: Colors.amber,
                          fontSize: 12.0,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                          ),
                          textAlign: TextAlign.center,
                      ),
                    )
                  ),
                ),
                  Flexible(
                      child: Card(
                        color: Colors.white12,
                        child: ListTile(
                          title: Text("Nutritionists", style: TextStyle(
                          color: Colors.amber,
                          fontSize: 14.0,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                          ),
                            textAlign: TextAlign.center, 
                          ),
                          subtitle: Text("50", style: TextStyle(
                            color: Colors.amber,
                            fontSize: 12.0,
                            fontFamily: 'assets/fonts/Changa-Bold.ttf',
                            ),
                            textAlign: TextAlign.center,
                        ),
                      )
                    ),
                  ),
                  Flexible(
                    child: Card(
                      color: Colors.white12,
                      child: ListTile(
                        title: Text("Members", style: TextStyle(
                            color: Colors.amber,
                            fontSize: 14.0,
                            fontFamily: 'assets/fonts/Changa-Bold.ttf',
                            ),
                          textAlign: TextAlign.center, 
                        ),
                        subtitle: Text("50", style: TextStyle(
                          color: Colors.amber,
                          fontSize: 12.0,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                          ),
                          textAlign: TextAlign.center,
                      ),
                    )
                  ),
                ),
                ],
              ),
              Container(padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0) ,
                child: Text("Info",style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'assets/fonts/Changa-Bold.ttf',
              ))),
              Container(
                child: CrowdMeter(
                  checkedInMembers: 60,
                  totalMembers: 100,
                  ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin psum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignidignissim erat in accumsan tempus. Mauris congue luctus neque, in semper purus maximus iaculis. Donec et eleifend quam, a sollicitudin magna.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 15.0,
                      fontFamily: 'assets/fonts/ProximaNova-Regular.otf',
                    ),
                  ),
              ),
              SizedBox(height: 80,),
            ],
          ),
        ],
        
      ),
    );
  }
}