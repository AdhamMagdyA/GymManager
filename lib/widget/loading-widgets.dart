import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}

class EmptyListError extends StatelessWidget {
  String message;
  EmptyListError(this.message);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(message,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )));
  }
}

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('An error occurred',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )));
  }
}
