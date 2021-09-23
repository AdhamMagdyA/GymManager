import 'package:flutter/material.dart';
import 'package:gym_project/style/styling.dart';

class SupplementDetailsScreen extends StatelessWidget {
  final String role = 'member';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: this.role == 'admin' ? Container(
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, '/edit-supplement');
            },
            isExtended: false,
            label: Icon(Icons.edit),
          ),
          height: MediaQuery.of(context).size.height * 0.075,
          width: MediaQuery.of(context).size.width * 0.1,
        )
        : Container(
          child: FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: Color(0xff181818),
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(0xff181818)),
                                  ),
                                  content: Text(
                                    "Booking Done\n\nPlease receive your order from your branch",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily:
                                          'assets/fonts/Changa-Bold.ttf',
                                      fontSize: 18,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                   actions: [
                                    MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("OK",style: TextStyle(color: Colors.black),),
                                          color: Colors.amber,
                                          shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide:
                                                BorderSide(color: Colors.amber,
                                          ),
                                        ),),
                                   ],
                                ),
                              );
              },
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
          floatingActionButtonLocation: this.role == 'admin'? FloatingActionButtonLocation.miniEndFloat : FloatingActionButtonLocation.centerFloat,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  color: Color(0xff181818),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: new Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xFFFFCE2B),
                          size: 22.0,
                        ),
                      ),
                        //-->header
                      Text('Supplement Info',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontFamily: 'sans-serif-light',
                                color: Colors.white)),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: this.role == 'admin' ? new Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 22.0,
                        ):Container(),
                      ),
                    ],
                  ),
                ),
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
      ),
    );
  }
}