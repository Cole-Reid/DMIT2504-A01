import 'package:flutter/material.dart';

// no more gross tight coupling


class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}


class _HomeState extends State<Home> { 

  @override build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          
          const Text('This is the homepage; if you don\'t like it, leave!'),
          
          ElevatedButton(
            onPressed: () {
              // push()      -> requires returned widget wrapped inside MaterialPageRoute
              // pushNamed() -> requires string corresponding to mapped route
              Navigator.of(context).pushNamed('/other-page');

            },
            child: const Text("go to other page"),
          ),

          const SizedBox(height: 32),

          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/returned-data');
            },
            child: const Text("go to page and back to see returned data"),
          ),

        ]
      ),
    );
  }

}