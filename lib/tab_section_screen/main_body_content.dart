import 'package:flutter/material.dart';

class MainBodyContentContainer extends StatelessWidget {
  const MainBodyContentContainer({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Container was not removed to reduce potential conflicts when the lint is initially added
        // TODO: Remove unnecessary container when editing the code below
        // ignore: avoid_unnecessary_containers
        Container(
          // Padding here is for custom card shadow to show properly
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ],
    );
  }
}
