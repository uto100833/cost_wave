import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          "Cost Wave",
          style: Theme.of(context).textTheme.headlineSmall,
        ));
  }
}
