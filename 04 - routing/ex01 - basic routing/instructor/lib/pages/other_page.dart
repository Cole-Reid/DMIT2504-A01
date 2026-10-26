import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {

  const OtherPage({super.key});

  @override build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text('This is another page!'),
          ElevatedButton(
            onPressed: () {
              print("when I'm clicked, take me back to the homepage.");
            },
            child: const Text("go back"),
          ),
        ]
      ),
    );
  }

}