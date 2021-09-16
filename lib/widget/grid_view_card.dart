import 'package:flutter/material.dart';

//if there is no subTitle1,2,3,4 put their values in the call with ''
// ignore: non_constant_identifier_names
Widget GridViewCard(image, title, subTitle1, subTitle2, subTitle3, subTitle4) {
  return Container(
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.all(0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              )),
          !(subTitle1 == '')
              ? Text(subTitle1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ))
              : Container(),
          !(subTitle2 == '')
              ? Text(subTitle2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ))
              : Container(),
          !(subTitle3 == '')
              ? Text(subTitle3,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ))
              : Container(),
          !(subTitle4 == '')
              ? Text(subTitle4,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ))
              : Container(),
        ],
      ),
    ),
  );
}
