import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  Offset _offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(0.01 * _offset.dy)
        ..rotateY(-0.01 * _offset.dx),
      alignment: FractionalOffset.center,
      child: GestureDetector(
        onPanUpdate: (details) => setState(() => _offset += details.delta),
        onDoubleTap: () => setState(() {
          _offset = Offset.zero;
        }),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('The Matrix 3D'),
          ),
          body: const Center(
              child: Text(
            "FlutterQueen",
            style: TextStyle(
                color: Colors.purple,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5),
          )),
        ),
      ),
    );
  }
}
