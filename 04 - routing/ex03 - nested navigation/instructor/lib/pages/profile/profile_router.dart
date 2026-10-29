import 'package:flutter/material.dart';

import 'routes.dart';  // gotta import my route mapping
// and every single page we want to route to; this file is where route name <-> widget are bound together
import 'profile_page.dart';
import 'profile_options1.dart';
import 'profile_options2.dart';
import 'profile_options3.dart';


// instead of importing every little route/widget in my top-level router,
// I now have this ProfileRouter() I can pass instead, which will dynamically generate the route
// (and therefore determine what needs to be rendered) whenever profile/ or anything inside profile/ is hit as a route.
class ProfileRouter extends StatefulWidget {

  const ProfileRouter({super.key});

  @override
  State<ProfileRouter> createState() => _ProfileRouterState();

}


class _ProfileRouterState extends State<ProfileRouter> {

  // we need to have a persistent way to reference this navigator across rebuilds
  // when we create our own new stateful things (new navigator, form, etc.) we gotta supply that key
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Navigator(
        key: _navigatorKey,
        initialRoute: profileHomeRoute,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {

    Widget page;

    // boilerplate is the same as the main.dart functional router
    switch (settings.name) {
      case profileHomeRoute:
        page = const ProfilePage();
        break;
      case profileOptions1Route:
        page = const ProfileOptions1();
        break;
      case profileOptions2Route:
        page = const ProfileOptions2();
        break;
      case profileOptions3Route:
        page = const ProfileOptions3();
        break;
      default:
        throw Exception('Unknown profile route: ${settings.name}');
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) => page,
      settings: settings,  // pass settings to next route (contains route name & args)
    );

  }

}