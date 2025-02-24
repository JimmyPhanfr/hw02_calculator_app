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
      home: const MyHomePage(title: 'Calculator App Homepage'),
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

  int _value = 0;

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
            Text(
              '$_value',
              style: TextStyle(fontSize: 50.0),
            ),
            // 7 8 9 /
            Row(
              children: [
                TextButton(
                  child: Text('7'),
                  onPressed: () {
                    
                  },
                ),
                TextButton(
                  child: Text('8'),
                  onPressed: () {
                    
                  },
                ),
                TextButton(
                  child: Text('9'),
                  onPressed: () {
                    
                  },
                ),
                TextButton(
                  child: Text('/'),
                  onPressed: () {
                    
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
                    
                  },
                ),
                TextButton(
                  child: Text('5'),
                  onPressed: () {
                    
                  },
                ),
                TextButton(
                  child: Text('6'),
                  onPressed: () {
                    
                  },
                ),
                TextButton(
                  child: Text('*'),
                  onPressed: () {
                    
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
                    
                  },
                ),
                TextButton(
                  child: Text('2'),
                  onPressed: () {
                    
                  },
                ),
                TextButton(
                  child: Text('3'),
                  onPressed: () {
                    
                  },
                ),
                TextButton(
                  child: Text('-'),
                  onPressed: () {
                    
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
                    
                  },
                ),
                TextButton(
                  child: Text('='),
                  onPressed: () {
                    
                  },
                ),
                TextButton(
                  child: Text('<'),
                  onPressed: () {
                    
                  },
                ),
                TextButton(
                  child: Text('+'),
                  onPressed: () {
                    
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
