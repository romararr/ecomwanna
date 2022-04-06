import 'package:flutter/material.dart';

class NumberCount extends StatefulWidget {
  @override
  _NumberCountState createState() => _NumberCountState();
}

class _NumberCountState extends State<NumberCount> {
  int _number = 1;

  void add() {
    setState(() {
      _number++;
    });
  }

  void remove() {
    setState(() {
      _number--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     border: Border.all(color: Colors.grey),
      //     borderRadius: const BorderRadius.all(Radius.circular(6))),
      // width: 200,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                (_number > 1) ? remove() : null;
              },
              icon: const Icon(
                Icons.remove,
                size: 14,
              )),
          SizedBox(
            width: 20,
            child: Center(child: Text('$_number')),
          ),
          IconButton(
              onPressed: add,
              icon: const Icon(
                Icons.add,
                size: 14,
              )),
        ],
      ),
    );
  }
}
