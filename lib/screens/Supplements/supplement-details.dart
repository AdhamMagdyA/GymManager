import 'package:flutter/material.dart';
import 'package:gym_project/style/styling.dart';

class SupplementDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Container(
        child: FloatingActionButton.extended(
            onPressed: () {},
            isExtended: true,
            label: Text('Request Now !' ,style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'assets/fonts/Changa-Bold.ttf',
                  ),),
          ),
          height: MediaQuery.of(context).size.height*0.075,
          width : MediaQuery.of(context).size.width*0.45,
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                child:Image.asset(
                      'assets/images/supp.jpg',
                      fit: BoxFit.fill, 
                    ),
                    height: MediaQuery.of(context).size.height*0.3,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                        
                        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10),
                        child: Text("Product Name", style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        ),),
                      ),
                  Container(
                    child: Text("\$1000", style: TextStyle(
                      color: Colors.amber,
                      fontSize: 28.0,
                      fontFamily: 'assets/fonts/Changa-Bold.ttf',
                    )),
                    padding:EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  ),    
                ],
              ),
              Container(padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0) ,
                child: Text("Description",style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'assets/fonts/Changa-Bold.ttf',
              ))),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text("Da Agmad Product 3andena hena ",
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