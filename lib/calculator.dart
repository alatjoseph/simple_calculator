import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = '';
  String result = '0';
  String expression = '';
  buttonpressed(String btntxt) {
    setState(() {
      if (btntxt == 'C') {
        result = '0';
        equation = '0';
      } else if (btntxt == '⌫') {
        equation = equation.substring(0, equation.length - 1);
      } else if (btntxt == '=') {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          'error';
        }
      } else {
        if (equation == '0') {
          equation = btntxt;
        } else {
          equation = equation + btntxt;
        }
      }
    });
  }

  Widget callbutton(String text, Color colour) {
    return InkWell(
      onTap: () {
        buttonpressed(text);
      },
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: colour, borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              //equation
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 70,
                width: double.infinity,
                color: Colors.black,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      equation,
                      style: TextStyle(color: Colors.white, fontSize: 40),
                      textAlign: TextAlign.end,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //result
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 70,
                width: double.infinity,
                color: Colors.black,
                child: Text(
                  result,
                  style: TextStyle(color: Colors.white, fontSize: 50),
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  callbutton('C', Color.fromARGB(255, 50, 46, 46)),
                  callbutton('%', Color.fromARGB(255, 50, 46, 46)),
                  callbutton('⌫', Color.fromARGB(255, 50, 46, 46)),
                  callbutton('÷', Color.fromARGB(232, 18, 185, 215)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  callbutton('7', Color.fromARGB(255, 130, 126, 126)),
                  callbutton('8', Color.fromARGB(255, 130, 126, 126)),
                  callbutton('9', Color.fromARGB(255, 130, 126, 126)),
                  callbutton('×', Color.fromARGB(232, 18, 185, 215))
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  callbutton('4', Color.fromARGB(255, 130, 126, 126)),
                  callbutton('5', Color.fromARGB(255, 130, 126, 126)),
                  callbutton('6', Color.fromARGB(255, 130, 126, 126)),
                  callbutton('-', Color.fromARGB(232, 18, 185, 215))
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  callbutton('1', Color.fromARGB(255, 130, 126, 126)),
                  callbutton('2', Color.fromARGB(255, 130, 126, 126)),
                  callbutton('3', Color.fromARGB(255, 130, 126, 126)),
                  callbutton('+', Color.fromARGB(232, 18, 185, 215))
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  callbutton('00', Color.fromARGB(255, 130, 126, 126)),
                  callbutton('0', Color.fromARGB(255, 130, 126, 126)),
                  callbutton('.', Color.fromARGB(255, 130, 126, 126)),
                  callbutton('=', Color.fromARGB(232, 18, 185, 215))
                ],
              ),
            ],
          )),
    );
  }
}
