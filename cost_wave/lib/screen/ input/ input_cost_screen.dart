import 'package:cost_wave/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class InputCostPage extends StatefulWidget {
  const InputCostPage({super.key, this.animationController});

  final AnimationController? animationController;

  @override
  _InputCostPageState createState() => _InputCostPageState();
}
class _InputCostPageState extends State<InputCostPage> with TickerProviderStateMixin {


  late AnimationController _animationController;
  late Animation<double> _topBarAnimation;

  double _topBarOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomAppBar(
            animationController: _animationController,
            topBarAnimation: _topBarAnimation,
            topBarOpacity: _topBarOpacity,
          ),
          const Center(
        child: const Text('This is the Add Item Screen'),
      ),
        ],
      ),
    );
  }
}
