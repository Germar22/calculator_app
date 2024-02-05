import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simplecalculator/operations.dart';
import 'package:flutter_toast_bar/flutter_toast_bar.dart';
import 'floatingactionbutton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  TextEditingController txtNumber1 = TextEditingController();
  TextEditingController txtNumber2 = TextEditingController();
  Operation operation = Operation();

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
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: TextField(
                controller: txtNumber1,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Number 1',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: TextField(
                controller: txtNumber2,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Number 2',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Positioned(
              bottom: 300,
              child: FloatingActionButtonCustom(
                title: 'Addition',
                onPressed: () {
                  operation.calculate(
                    context,
                    "add",
                    double.parse(txtNumber1.text),
                    double.parse(txtNumber2.text),
                  );
                },
                icon: const Icon(Icons.add),
              ),
            ),
            Positioned(
              bottom: 200,
              child: FloatingActionButtonCustom(
                title: 'Subtraction',
                onPressed: () {
                  operation.calculate(
                    context,
                    "subtract",
                    double.parse(txtNumber1.text),
                    double.parse(txtNumber2.text),
                  );
                },
                icon: const Icon(Icons.remove),
              ),
            ),
            Positioned(
              bottom: 100,
              child: FloatingActionButtonCustom(
                title: 'Multiplication',
                onPressed: () {
                  operation.calculate(
                    context,
                    "multiply",
                    double.parse(txtNumber1.text),
                    double.parse(txtNumber2.text),
                  );
                },
                icon: const Icon(CupertinoIcons.multiply),
              ),
            ),
            Positioned(
              bottom: 0,
              child: FloatingActionButton(
                onPressed: () {
                  operation.calculate(
                    context,
                    "divide",
                    double.parse(txtNumber1.text),
                    double.parse(txtNumber2.text),
                  );
                },
                tooltip: 'Division',
                child: const Icon(CupertinoIcons.divide),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
