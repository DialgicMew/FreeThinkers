import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Screens/screens.dart';
import './Providers/UserProvider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider.value(value: AuthProvider.initialize()),
    //     ChangeNotifierProvider(create: (_) => NameProvider()),
    //   ],
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(fontFamily: 'raleway'),
    //     title: 'London Street',
    //     onGenerateRoute: routes,
    //   ),
    // );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Free Thinkers',
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        switch (settings.name) {
          case '/':
            {
              return Login();
            }
          case Home.homeRoute:
            {
              return Home();
            }
          case UrlPage.urlRoute:
            {
              return UrlPage();
            }
          case NotificationPage.notificationRoute:
            {
              return NotificationPage();
            }
          default:
            {
              return Home();
            }
        }
      },
    );
  }
}
