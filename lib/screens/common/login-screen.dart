import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gym_project/common/my_popup.dart';
import 'package:gym_project/screens/admin/util-screen.dart';
import 'package:gym_project/screens/coach/coach-tabs-screen.dart';
import 'package:gym_project/screens/member/member-util.dart';
import 'package:gym_project/screens/nutritionist/util-screen.dart';
import 'package:gym_project/viewmodels/login-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';
import '../../style/styling.dart';
import '../../widget/button.dart';
import 'package:gym_project/services/login-auth-webservice.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailNode = FocusNode();
  final TextEditingController emailController =
      TextEditingController(text: 'mavis55@example.net');
  final TextEditingController passwordController =
      TextEditingController(text: 'secret');
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

  var loginViewModel;

  @override
  void didChangeDependencies() {
    loginViewModel = Provider.of<LoginViewModel>(context);
    token = loginViewModel.token;

    role = loginViewModel.role;

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<User>(context, listen: false).setRole(role);
      Provider.of<User>(context, listen: false).setToken(token);
      if (role == 'admin') {
        Navigator.pushReplacementNamed(
          context,
          '/admin/util',
        );
      } else if (role == 'coach') {
        Navigator.pushReplacementNamed(
          context,
          '/coach/util',
        );
      } else if (role == 'nutritionist') {
        Navigator.pushReplacementNamed(context, '/nutritionist/util');
      } else if (role == 'member') {
        Navigator.pushReplacementNamed(context, '/member/util');
      }
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  var token;
  var role;

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 5), () {
    //   if (login) {
    //     token = Provider.of<LoginViewModel>(context).token;
    //     role = Provider.of<LoginViewModel>(context).role;
    //   }
    // });
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
                                    controller: emailController,
                                    labelText: 'Email',
                                    node: _emailNode,
                                  ),
                                  SizedBox(height: 10),
                                  _textField(
                                    controller: passwordController,
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
                                    onTap: () {
                                      setState(() {
                                        Provider.of<LoginViewModel>(context,
                                                listen: false)
                                            .fetchLogin(emailController.text,
                                                passwordController.text)
                                            .catchError((err) {
                                          print('error found $err');
                                          showErrorMessage(context);
                                        });
                                      });
                                    }),
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

  Future<dynamic> showErrorMessage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    'Failed to login!',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  TextField _textField(
      {String labelText,
      final node,
      bool obscure = false,
      TextEditingController controller}) {
    return TextField(
      controller: controller,
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
