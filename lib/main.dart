import 'package:flutter/material.dart';

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

  int result = 0;
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
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Text(
                '$result',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Text(
                _entered,
                style: TextStyle(fontSize: 50.0),
              ),
            ),
            // Clear, - (unary), % (percentage), MOD
            Row(
              children: [
                TextButton(
                  child: Text('CE'),
                  onPressed: () {
                    setState( () {
                      _entered = '';
                    });
                  },
                ),
                TextButton(
                  child: Text('-'),
                  onPressed: () {
                    setState(() {
                      appendToEntered(_entered, '-');                     
                    });
                  },
                ),
                TextButton(
                  child: Text('%'),
                  onPressed: () {
                    // TODO: add int -> percentage functionality
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
                      _entered = appendToEntered(_entered, '÷');
                    });
                  },
                ),
              ],
            ),
            // 4 5 6 *
            Row(
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
                      _entered = appendToEntered(_entered, '–');
                    });
                  },
                ),
              ],
            ),
            // 0 = < +
            Row(
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
                      // TODO: add '=' functionality
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
