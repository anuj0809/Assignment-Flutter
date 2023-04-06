import 'package:flutter/material.dart';
import './contants.dart';

class OneSeat extends StatelessWidget {
  const OneSeat(
      {super.key,
      required this.count,
      required this.position,
      required this.selected});
  final int count, position, selected;
  Color decideColor(int sum) {
    return selected == sum ? darkBlue : blue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
          // padding: const EdgeInsets.all(20),
          width: 70,
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2.5, color: denseBlue),
            color: decideColor(calculate(count, position, 7)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('${calculate(count, position, 7)}'),
              Text(
                position == 0 ? 'Side Lower' : 'Side Upper',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          )),
    );
  }
}

int calculate(int count, int position, int add) {
  return ((count * 8) + add + (1 * position));
}
