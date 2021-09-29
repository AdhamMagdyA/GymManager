import 'package:flutter/material.dart';

Widget buildTextFormFieldLabel(String label) {
  return Padding(
    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
    child: new Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(
              label,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildTextFormField({
  String hintText,
  TextEditingController controller,
  String Function(String) validator,
}) {
  return Padding(
    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
    child: new Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Flexible(
          child: new TextFormField(
              decoration: InputDecoration(
                hintText: hintText,
              ),
              controller: controller,
              validator: validator),
        ),
      ],
    ),
  );
}

Widget buildHeader(BuildContext context) {
  Text editSetTextWidget = Text(
    'Create Group',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      fontFamily: 'sans-serif-light',
      color: Colors.white,
    ),
  );

  return Container(
    height: 100.0,
    color: Color(0xFF181818), //background color
    child: Padding(
      padding: EdgeInsets.only(left: 20.0, top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFFFCE2B),
              size: 22.0,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: editSetTextWidget,
          )
        ],
      ),
    ),
  );
}

Future viewErrorDialogBox(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.black,
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        TextButton(
          child: Text(
            'Ok',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    ),
  );
}
