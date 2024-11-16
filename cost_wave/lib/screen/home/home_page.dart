import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.animationController});

  final AnimationController? animationController;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
