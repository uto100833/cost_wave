import 'widgets/line_chart.dart';
import 'package:flutter/material.dart';

class TransitionPage extends StatefulWidget {
  const TransitionPage({super.key, this.animationController});

  final AnimationController? animationController;

  @override
  _TransitionPageState createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: Center(
            child: Card(
          color: Theme.of(context).colorScheme.primary,
          elevation: 8,
          child: Container(
            child: const CustomLineChart(),
          ),
        )));
  }
}
