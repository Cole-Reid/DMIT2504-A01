import 'package:flutter/material.dart';


// To set up a form, we 1) convert all our fields to formfields, 2) wrap everything in a Form.
// The point here is, all formfields within a form will validate at the same time when the form submission/validation is triggered.
class UserSignupForm extends StatelessWidget {

  const UserSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          const Text('New User Form', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),

          // every formfield has a validator.
          // it's a conditional expression that returns a value for the error message if failed, or null if succeeded
          TextFormField(
            // ternary gang!    condition ? ifTrue : ifFalse
            // You've noticed callbacks in flutter are usually () {} instead of () => {} as in JS.
            // You use () {} when returning a code block, or () => someValue when returning a value directly.
            validator: (value) => value == null || value.trim().isEmpty   // a.k.a. field is required
              ? 'Username cannot be empty'                                // check fails  -> return error message
              : null,                                                     // check passes -> return null 
            decoration: InputDecoration(label: Text('Username')),
          ),

          TextFormField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            validator: (value) => value == null || value.trim().isEmpty
              ? 'Username cannot be empty'
              : null,
            decoration: InputDecoration(label: Text('Password')),
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
      ),
    );
  }
}