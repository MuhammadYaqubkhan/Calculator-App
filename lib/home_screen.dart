import 'package:calculator_app/components/my_button.dart';
import 'package:calculator_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/main.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
static const String id = 'Home_Screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var userinput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 30,bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.white, width: 3)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                            child: Text(userinput.toString(),style: TextStyle(fontSize: 40,color: Colors.black),)),
                        SizedBox(
                          height: 25,
                        ),
                        Text(answer.toString(),style: TextStyle(fontSize: 40,color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        mybutton(title: 'AC',onPress: (){
                          userinput = '';
                          answer = '';
                          setState(() {

                          });
                        },),
                        mybutton(title: '+/-',onPress: (){
                          userinput += '+/-';
                          setState(() {

                          });
                        }),
                        mybutton(title: '%',onPress: (){
                          userinput += '%';
                          setState(() {

                          });
                        }),
                        mybutton(title: '/',color: Color(0xffffa00a),onPress: (){
                          userinput += '/';
                          setState(() {

                          });
                        }),
                      ],
                    ),
                    Row(
                      children: [
                        mybutton(title: '7',onPress: (){
                          userinput += '7';
                          setState(() {

                          });
                        },),
                        mybutton(title: '8',onPress: (){
                          userinput += '8';
                          setState(() {

                          });
                        }),
                        mybutton(title: '9',onPress: (){
                          userinput += '9';
                          setState(() {

                          });
                        }),
                        mybutton(title: 'x',color: Color(0xffffa00a),onPress: (){
                          userinput += 'x';
                          setState(() {

                          });
                        }),
                      ],
                    ),
                    Row(
                      children: [
                        mybutton(title: '4',onPress: (){
                          userinput += '4';
                          setState(() {

                          });
                        },),
                        mybutton(title: '5',onPress: (){
                          userinput += '5';
                          setState(() {

                          });
                        }),
                        mybutton(title: '6',onPress: (){
                          userinput += '6';
                          setState(() {

                          });
                        }),
                        mybutton(title: '-',color: Color(0xffffa00a),onPress: (){
                          userinput += '-';
                          setState(() {

                          });
                        }),
                      ],
                    ),
                    Row(
                      children: [
                        mybutton(title: '1',onPress: (){
                          userinput += '1';
                          setState(() {

                          });
                        },),
                        mybutton(title: '2',onPress: (){
                          userinput += '2';
                          setState(() {

                          });
                        }),
                        mybutton(title: '3',onPress: (){
                          userinput += '3';
                          setState(() {

                          });
                        }),
                        mybutton(title: '+',color: Color(0xffffa00a),onPress: (){
                          userinput += '+';
                          setState(() {

                          });
                        }),
                      ],
                    ),
                    Row(
                      children: [
                        mybutton(title: '0',onPress: (){
                          userinput += '0';
                          setState(() {

                          });
                        },),
                        mybutton(title: '.',onPress: (){
                          userinput += '.';
                          setState(() {

                          });
                        }),
                        mybutton(title: 'DEL',onPress: (){
                          userinput = userinput.substring( 0 , userinput.length - 1);
                          setState(() {

                          });
                        }),
                        mybutton(title: '=',color: Color(0xffffa00a),onPress: (){
                          equalPress();
                          setState(() {

                          });
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void equalPress (){
    String finaluserinput = userinput;
    finaluserinput = userinput.replaceAll('x', '*');
    Parser p= Parser();
    Expression expression = p.parse(finaluserinput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}


