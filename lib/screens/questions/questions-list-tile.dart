import 'package:flutter/material.dart';

class QuestionsListTile extends StatefulWidget {
  final String title;
  final String body;
  final String date;
  final int num_of_answers;
  final String role;
  //final String subtitle2;
  //final String subtitle3;
  Function ontap;

  QuestionsListTile(this.title, this.body, this.ontap, this.num_of_answers,
      this.date, this.role);
  @override
  _QuestionsListTileState createState() => _QuestionsListTileState();
}

class _QuestionsListTileState extends State<QuestionsListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        isThreeLine: true,
        onTap: widget.ontap,
        minVerticalPadding: 10,
        /*leading: CircleAvatar(
          radius: 20,
          child: Icon(Icons.account_circle),
        ),*/
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.account_circle),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.date,
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 12,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              /*Text(
                widget.date,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 12,
                  fontFamily: 'assets/fonts/Changa-Bold.ttf',
                ),
              ),*/
              widget.role == "question_owner"
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.body,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                fontSize: 15,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, right: 8),
                  child: TextButton(
                    onPressed: widget.ontap,
                    child: Text(
                      widget.num_of_answers.toString() + " Answers",
                      style: TextStyle(
                        color: Colors.amber,
                        fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
