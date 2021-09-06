import 'package:flutter/material.dart';
import '../../style/styling.dart';
import '../../widget/button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailNode = FocusNode();

  final _passwordNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailNode.addListener(() {
      setState(() {});
    });
    _passwordNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Image.asset(
                      'assets/images/details.png',
                      fit: BoxFit.fill,
                    )),
                Image.asset(
                  'assets/images/Rectangle.png',
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: PadRadius.horizontal - 15),
                      child: Column(
                        children: [
                          SizedBox(height: 130),
                          Expanded(
                            flex: 5,
                            child: Image(
                                image: AssetImage(
                                    '../../../assets/images/logo-no.png')),
                          ),
                          SizedBox(height: 50),
                          Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  _textField(
                                    labelText: 'Email',
                                    node: _emailNode,
                                  ),
                                  SizedBox(height: 10),
                                  _textField(
                                    labelText: 'Password',
                                    obscure: true,
                                    node: _passwordNode,
                                  ),
                                  SizedBox(height: 30),
                                  Text('Forgot your password?'),
                                ],
                              )),
                          Expanded(
                            flex: 5,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Button(
                                  border: false,
                                  btnTxt: 'Login',
                                  roundedBorder: true,
                                ),
                              ],
                            ),
                          )
                        ],
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

  TextField _textField({String labelText, final node, bool obscure = false}) {
    return TextField(
      focusNode: node,
      obscureText: obscure,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        labelStyle: TextStyle(
          color: node.hasFocus ? Color(0xFFFFCE2B) : Colors.white,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFFFCE2B),
            width: 2.0,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
