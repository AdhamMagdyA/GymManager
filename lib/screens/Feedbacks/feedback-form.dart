import 'package:flutter/material.dart';
import 'package:gym_project/style/styling.dart';

class FeedbackForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          // Text(
          //   "Feedbacks",
          //   style: TextStyle(fontFamily: "assets/fonts/Changa-Bold.ttf", fontSize: 35)
          // ),
          // Text.rich(
          //   TextSpan(children: [
          //     TextSpan(text: "Tell us your feedbacks", style: TextStyle(color: Colors.amber,fontSize: 16)),
          //   ]),
          // ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Image(
                                  image: AssetImage(
                                      '../../../assets/images/feed2.png')),
                      ),
                          ),
                  const SizedBox(height: 20.0),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: Text("Feedback title", style: TextStyle(fontSize: 18),)),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: TextField(
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder:const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                      hintText: 'Title ',
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey)
                      ),
                      style: TextStyle(color: Colors.white),

                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: Text("Feedback Description", style: TextStyle(fontSize: 18),)),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: TextField(
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder:const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                      hintText: 'Description ',
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey)
                      ),
                      style: TextStyle(color: Colors.white),
                      maxLines: 5,

                    ),
                  ),
                  const SizedBox(height: 30.0),
                  
                  Container(
                    //width: double.infinity,
                    width: MediaQuery.of(context).size.width*0.5,
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(PadRadius.radius)),
                      color: Colors.amberAccent,
                      child: Text("Send Feedback",style: TextStyle(fontWeight: FontWeight.bold),),
                      onPressed: () =>{},
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}