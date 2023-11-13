import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  String _currentInput = '';
  String _operator = '';
  double _result = 0.0;

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _currentInput = '';
        _output = '0';
        _operator = '';
        _result = 0.0;
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        _operator = buttonText;
        _result = double.parse(_currentInput);
        _currentInput = '';
      } else if (buttonText == '=') {
        switch (_operator) {
          case '+':
            _result += double.parse(_currentInput);
            break;
          case '-':
            _result -= double.parse(_currentInput);
            break;
          case '*':
            _result *= double.parse(_currentInput);
            break;
          case '/':
            _result /= double.parse(_currentInput);
            break;
          default:
            break;
        }
        _output = _result.toString();
        _operator = '';
        _currentInput = '';
      } else {
        _currentInput += buttonText;
        _output = _currentInput;
      }
    });
  }

 Widget _buildButton(String buttonText, {Color color = Colors.white}) {
  return Expanded(
    child: ElevatedButton(
      onPressed: () => _onButtonPressed(buttonText),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 26.0),
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        onPrimary: Colors.black,
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(),
          Row(
            children: <Widget>[
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/', color: Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('*', color: Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-', color: Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('0'),
              _buildButton('C'),
              _buildButton('='),
              _buildButton('+', color: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}
