import 'package:flutter/material.dart';
import 'package:gym_project/screens/questions/add-question-screen.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class AnswersListTile extends StatefulWidget {
  final String title;
  final String body;
  final String date;
  String role;

  AnswersListTile({
    this.title,
    this.body,
    this.date, //this.role
  });
  @override
  _AnswersListTileState createState() => _AnswersListTileState();
}

class _AnswersListTileState extends State<AnswersListTile> {
  bool is_visible;
  bool edit;
  final TextEditingController _textController = TextEditingController();
  Color iconColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    is_visible = true;
    edit = false;
    _textController.text = widget.body;
    iconColor = Colors.amber;
    widget.role = Provider.of<User>(context, listen: false).role;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: is_visible,
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: 10),
        child: !edit
            ? ListTile(
                isThreeLine: true,
                minVerticalPadding: 10,
                title: Padding(
                  padding:
                      const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
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
                            width: 15,
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
                      (widget.role == "answer_owner" || widget.role == "admin")
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor: Color(0xFF181818),
                                        shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Color(0xFF181818)),
                                        ),
                                        content: Text(
                                          "Would you like to delete this answer ?",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily:
                                                'assets/fonts/Changa-Bold.ttf',
                                            fontSize: 15,
                                            //fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              MaterialButton(
                                                onPressed: () {
                                                  setState(() {
                                                    is_visible = false;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("YES"),
                                                color: Colors.amber,
                                                shape: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide(
                                                      color: Colors.amber),
                                                ),
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("NO"),
                                                color: Colors.amber,
                                                shape: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide(
                                                      color: Colors.amber),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      edit = true;
                                    });
                                  },
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
                  ],
                ),
              )
            : Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLines: 8,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        fontSize: 15,
                      ),
                      controller: _textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.amber),
                        ),
                        hintText: 'Write an answer...',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                          fontSize: 15,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.yellow),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: iconColor,
                          ),
                          onPressed: _textController.text.isEmpty
                              ? null
                              : () {
                                  setState(() {
                                    edit = false;
                                  });
                                },
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        if (_textController.text.isEmpty) {
                          setState(() {
                            iconColor = Colors.grey;
                          });
                        } else {
                          setState(() {
                            iconColor = Colors.amber;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
