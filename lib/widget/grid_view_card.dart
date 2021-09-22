import 'package:flutter/material.dart';

//if there is no subTitle1,2,3,4 put their values in the call with ''
// ignore: non_constant_identifier_names
Widget GridViewCard(image, title, subTitle1, subTitle2, subTitle3, subTitle4) {
  int numSubtitles = 0;
  if (subTitle1 != '') {
    numSubtitles++;
  }
  if (subTitle2 != '') {
    numSubtitles++;
  }
  if (subTitle3 != '') {
    numSubtitles++;
  }
  if (subTitle4 != '') {
    numSubtitles++;
  }

  double height = numSubtitles == 1
      ? 100
      : numSubtitles == 2
          ? 140
          : numSubtitles == 3
              ? 180
              : numSubtitles == 4
                  ? 200
                  : 80;

  return Container(
    height: height,
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
        // mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 80,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
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
          if (subTitle1 != '')
            Text(subTitle1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                )),
          if (subTitle2 != '')
            Text(subTitle2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                )),
          if (subTitle3 != '')
            Text(subTitle3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                )),
          if (subTitle4 != '')
            Text(subTitle4,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                )),
        ],
      ),
    ),
  );
}
