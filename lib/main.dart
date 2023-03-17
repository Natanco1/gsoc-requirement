import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        /*decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/LIQUIDGALAXYLOGO.png'),
          ),
        ),*/
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('button'),
                  ),
                  const Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: double.infinity,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('button'),
                  ),
                ],
              ),
            ),
            const Flexible(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('button'),
                  ),
                  const Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: double.infinity,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('button'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
