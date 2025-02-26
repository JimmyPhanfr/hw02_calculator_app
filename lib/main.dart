import 'package:flutter/material.dart';
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

  String result = '0';
  String _entered = '';

    // bool _isresult_decimal = true;

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

  String calculate(String mEntered){
    try {
      var exp = GrammarParser().parse(mEntered);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      if (evaluation.toString() == 'Infinity') {
        return 'Error: Cannot divide by 0';
      }
      return evaluation.toString();
    } 
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: FittedBox(
                  alignment: Alignment(1.0, 0.0),
                  child: Text(
                    result,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: FittedBox(
                  alignment: Alignment(1.0, 0.0),
                  child: Text(
                    _entered,
                  ),
                ),
              ),
            ),
            // Clear, (, ), MOD
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text('CE'),
                  onPressed: () {
                    setState( () {
                      result = '0';
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
            // 7 8 9 /
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
            // 4 5 6 *
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
            // 1 2 3 -
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
            // 0 = < +
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
                      result = calculate(_entered);
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
