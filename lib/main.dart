import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Regex(),
    );
  }
}

class Regex extends StatefulWidget {
  const Regex({super.key});

  @override
  State<Regex> createState() => _RegexState();
}

class _RegexState extends State<Regex> {
  TextEditingController inputString = TextEditingController();
  TextEditingController givenPatteren = TextEditingController();

  String result = '';

  void regexMatch() {
    RegExp regex = RegExp(givenPatteren.text);
    Iterable<Match> matches = regex.allMatches(inputString.text);
    setState(() {
      if (matches.isNotEmpty) {
        List<String> matchedStrings = [];
        for (Match match in matches) {
          matchedStrings.add(match.group(0) as String);
        }
        result = 'Match Found: ${matchedStrings.join(" ")}';
      } else {
        result = 'No Match Found';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Regex App'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: inputString,
            decoration: InputDecoration(
                labelText: 'Enter Your String',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: givenPatteren,
            decoration: InputDecoration(
                labelText: 'Enter Your Patteren',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: regexMatch, child: Text('Show Result')),
          Text('Result: ${result}'),
        ],
      ),
    );
  }
}
