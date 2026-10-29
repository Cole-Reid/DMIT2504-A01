import 'package:flutter/material.dart';

import 'routes.dart';  // gotta import my route mapping
// and every single page we want to route to; this file is where route name <-> widget are bound together
import 'profile_page.dart';
import 'profile_options1.dart';
import 'profile_options2.dart';
import 'profile_options3.dart';

class ProfileRouter extends StatefulWidget {

  const ProfileRouter({super.key});

  @override
  State<ProfileRouter> createState() => _ProfileRouterState();

}


class _ProfileRouterState extends State<ProfileRouter> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
    );
  }

}