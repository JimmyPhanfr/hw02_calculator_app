import 'package:flutter/material.dart';
// imports math_expressions to parse and calculate equations user writes
import 'package:math_expressions/math_expressions.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.amberAccent),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // _result will store value calculated from _entered when user presses the '=' button.
  String _result = '0';
  String _entered = '';

  String appendToEntered(String mEntered, String a){
    mEntered += a;
    return mEntered;
  }

  String backspace(String mEntered){
    if (mEntered.isNotEmpty) {
      mEntered = mEntered.substring(0, mEntered.length - 1);
    }
    return mEntered;
  }

  // function implements the math expressions package to robustly calculates the _result
  String calculate(String mEntered){
    try {
      var exp = GrammarParser().parse(mEntered);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      // the math expressions package will return infinity if a number is divided by zero, which we will inform the user of an error.
      if (evaluation.toString() == 'Infinity') {
        return 'Error: Cannot divide by 0';
      }
      return evaluation.toString();
    } 
    // catches if extra operators are included in the expression or other errors
    catch(e) {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Textbox that displays 'Result:'
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: SizedBox(
                height: 40,
                width: double.infinity/5,
                child: FittedBox(
                  alignment: Alignment(1.0, 0.0),
                  child: Text(
                    'Result:',
                  ),
                ),
              ),
            ),
            // Textbox that displays the value of _result
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: FittedBox(
                  alignment: Alignment(1.0, 0.0),
                  child: Text(
                    _result,
                  ),
                ),
              ),
            ),
            // Textbox that displays the expression user has written, else displays prompt for user to press buttons
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: FittedBox(
                  alignment: Alignment(1.0, 0.0),
                  child: _entered == '' ? 
                  Text(
                    'Press buttons to write equation', 
                    style: TextStyle(color: Colors.grey), 
                    ) : 
                  Text(_entered),
                ),
              ),
            ),
            // Row includes Clear, (, ), MOD buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text('Clear'),
                  onPressed: () {
                    setState( () {
                      _result = '0';
                      _entered = '';
                    });
                  },
                ),
                TextButton(
                  child: Text('('),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '(');
                    });
                  },
                ),
                TextButton(
                  child: Text(')'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, ')');
                    });
                  },
                ),
                TextButton(
                  child: Text('MOD'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '%');
                    });
                  },
                ),
              ],
            ),
            // row includes 7, 8, 9, / buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text('7'),
                  onPressed: () {
                    setState( () {
                      _entered = _entered = appendToEntered(_entered, '7');
                    });
                  },
                ),
                TextButton(
                  child: Text('8'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '8');
                    });
                  },
                ),
                TextButton(
                  child: Text('9'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '9');
                    });
                  },
                ),
                TextButton(
                  child: Text('÷'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '/');
                    });
                  },
                ),
              ],
            ),
            // Row includes 4, 5, 6, * buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text('4'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '4');
                    });
                  },
                ),
                TextButton(
                  child: Text('5'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '5');
                    });
                  },
                ),
                TextButton(
                  child: Text('6'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '6');
                    });
                  },
                ),
                TextButton(
                  child: Text('*'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '*');
                    });
                  },
                ),
              ],
            ),
            // Row includes 1, 2, 3, - buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text('1'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '1');
                    });
                  },
                ),
                TextButton(
                  child: Text('2'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '2');
                    });
                  },
                ),
                TextButton(
                  child: Text('3'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '3');
                    });
                  },
                ),
                TextButton(
                  child: Text('–'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '-');
                    });
                  },
                ),
              ],
            ),
            // Row includes 0, =, <-, + buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text('0'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '0');
                    });
                  },
                ),
                TextButton(
                  child: Text('='),
                  onPressed: () {
                    setState( () {
                      _result = calculate(_entered);
                    });
                  },
                ),
                TextButton(
                  child: Text('<—'),
                  onPressed: () {
                    setState( () {
                      _entered = backspace(_entered);
                    });
                  },
                ),
                TextButton(
                  child: Text('+'),
                  onPressed: () {
                    setState( () {
                      _entered = appendToEntered(_entered, '+');
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
