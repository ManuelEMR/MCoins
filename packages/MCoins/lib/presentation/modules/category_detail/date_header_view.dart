import 'package:flutter/material.dart';

class DateHeaderView extends StatelessWidget {
  final String date;
  const DateHeaderView({@required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
        height: 60,
        child: Text(date,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white)));
  }
}
