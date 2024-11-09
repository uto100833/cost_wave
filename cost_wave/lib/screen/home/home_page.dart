import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: Center(
            child: Card(
                color: Theme.of(context).colorScheme.primary,
                elevation: 8,
                child: Container(
                  child: Text(
                    'Home Feed',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ))));
  }
}
