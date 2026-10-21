import 'package:flutter/material.dart';

class UserSignupForm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'New User Form',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('Username'),
          ),
        ),
        const TextField(
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
            label: Text('Password'),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
          ),
          onPressed: () => false,
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}