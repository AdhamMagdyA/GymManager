import 'package:flutter/material.dart';
import 'package:gym_project/screens/Supplements/supplement-details.dart';


//if there is no subTitle1,2,3,4 put their values in the call with ''
Widget SupplementCard(image, title, price, context,role) {
  return GestureDetector(
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6.0,
          ),
        ],
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage(image)),
            SizedBox(
              height: 5,
            ),
            Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                )),
            !(price=='')?
            Text(price,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                )):Container(),
                SizedBox(height: 10,),
            InkWell(
                      onTap: () {

                      },
                      child: role =='admin' ? new Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 25.0,
                      ):Container(),
                    ),    
          ],
        ),
      ),
    ),
    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SupplementDetailsScreen()));},
  );
}
