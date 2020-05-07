import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardColumn});

  final Color colour;
  final Widget cardColumn;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardColumn,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
    );
  }
}
