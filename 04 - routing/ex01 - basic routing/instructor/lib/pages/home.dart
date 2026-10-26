import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  const Home({super.key});

  @override build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text('This is the homepage; if you don\'t like it, leave!'),
          ElevatedButton(
            onPressed: () {
              print("when I'm clicked, take me to the other page.");
            },
            child: const Text("go to other page"),
          ),
        ]
      ),
    );
  }

}