import 'package:flutter/material.dart';
import './one_seat.dart';
import './three_seat.dart';

class SeatWidget extends StatefulWidget {
  const SeatWidget({super.key, required this.count, required this.selected});
  final int count;
  final int selected;
  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  @override
  Widget build(BuildContext context) {
    final int count = widget.count;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            ThreeSeat(count: count, position: 0, selected: widget.selected),
            const SizedBox(height: 10),
            ThreeSeat(count: count, position: 1, selected: widget.selected),
            const SizedBox(height: 15),
          ]),
          Column(
            children: [
              OneSeat(count: count, position: 0, selected: widget.selected),
              const SizedBox(height: 10),
              OneSeat(count: count, position: 1, selected: widget.selected),
              const SizedBox(height: 15),
            ],
          ),
        ],
      ),
    );
  }
}
