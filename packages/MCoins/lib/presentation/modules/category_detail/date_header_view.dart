import 'package:flutter/material.dart';

class DateHeaderView extends StatelessWidget {
  final String date;
  const DateHeaderView({@required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Text(date),
    );
  }
}
