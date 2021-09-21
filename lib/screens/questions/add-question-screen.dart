import 'package:flutter/material.dart';
import 'package:gym_project/widget/button.dart';

class AddQuestionScreen extends StatefulWidget {
  //const AddQuestionScreen({Key key}) : super(key: key);
  String title;
  String body;

  AddQuestionScreen({this.title, this.body});

  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  bool btn_enabled;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController.text = widget.title;
    _bodyController.text = widget.body;
    if (_titleController.text.isEmpty && _bodyController.text.isEmpty) {
      btn_enabled = false;
    } else {
      btn_enabled = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Add Question',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'assets/fonts/Changa-Bold.ttf',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'assets/fonts/Changa-Bold.ttf',
                    fontSize: 15,
                  ),
                  controller: _titleController,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'assets/fonts/Changa-Bold.ttf',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Enter your question\'s title',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'assets/fonts/Changa-Bold.ttf',
                      fontSize: 15,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    if (_bodyController.text.isNotEmpty &&
                        _titleController.text.isNotEmpty) {
                      setState(() {
                        btn_enabled = true;
                      });
                    } else {
                      setState(() {
                        btn_enabled = false;
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  maxLines: 15,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'assets/fonts/Changa-Bold.ttf',
                    fontSize: 15,
                  ),
                  controller: _bodyController,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    labelText: 'Body',
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Enter your question...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'assets/fonts/Changa-Bold.ttf',
                      fontSize: 15,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    if (_bodyController.text.isNotEmpty &&
                        _titleController.text.isNotEmpty) {
                      setState(() {
                        btn_enabled = true;
                      });
                    } else {
                      setState(() {
                        btn_enabled = false;
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(
                  onPressed: btn_enabled
                      ? () {
                          Navigator.pop(context);
                        }
                      : null,
                  height: 50,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  disabledColor: Color(0xFF404040),
                  color: btn_enabled ? Colors.amber : Color(0xFF404040),
                  child: Text(
                    'Post Question',
                    style: TextStyle(
                      color: btn_enabled ? Colors.black : Colors.white,
                      fontFamily: 'assets/fonts/Changa-Bold.ttf',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  elevation: 2,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: btn_enabled ? Colors.amber : Color(0xFF404040)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
