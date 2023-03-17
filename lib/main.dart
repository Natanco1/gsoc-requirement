import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gsoc_requirement/pages/second_page.dart';
import 'package:http/http.dart' as http;

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
      home: const MyHomePage(title: 'Gsoc Requirement'),
    );
  }
}

Future<String> _getFact() async {
  var response = await http.get(
    Uri.parse('https://catfact.ninja/fact'),
  );
  var decoded = jsonDecode(response.body)['fact'];
  return decoded;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool data = false;
  bool text = false;
  String fact = '';

  @override
  void initState() {
    data = false;
    text = false;
    fact = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.scaleDown,
            image: AssetImage(
                'assets/LOGO_LIQUID_GALAXY-sq300x300-pngtranspOK.png'),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  const Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: double.infinity,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SecondPage(),
                        ),
                      );
                    },
                    child: const Text('button 1'),
                  ),
                  const Flexible(
                    flex: 6,
                    child: SizedBox(
                      height: double.infinity,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.purple),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      var response = await _getFact();
                      setState(() {
                        fact = response;
                        data = true;
                      });
                    },
                    child: const Text('button 3'),
                  ),
                  if (data) ...[
                    Text(
                      fact,
                      textAlign: TextAlign.center,
                    ),
                  ] else ...[
                    SizedBox.shrink()
                  ],
                  const Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: double.infinity,
                    ),
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
                  const Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: double.infinity,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        text = true;
                      });
                    },
                    child: const Text('button 2'),
                  ),
                  if (text) ...[
                    const Text(
                      'you pressed the button!',
                      textAlign: TextAlign.center,
                    ),
                  ] else ...[
                    SizedBox.shrink()
                  ],
                  const Flexible(
                    flex: 6,
                    child: SizedBox(
                      height: double.infinity,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        data = false;
                        text = false;
                      });
                    },
                    child: const Text('button 4'),
                  ),
                  const Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: double.infinity,
                    ),
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
