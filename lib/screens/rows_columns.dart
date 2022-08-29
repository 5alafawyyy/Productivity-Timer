import 'package:flutter/material.dart';

class RowsAndColumnsScreen extends StatelessWidget {
  const RowsAndColumnsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rows and Colummns'),
      ),
      backgroundColor: Colors.indigo[100],
      body: const CustomColumn(),
    );
  }
}

class CustomColumn extends StatelessWidget {
  const CustomColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;

   List<Widget> x=  createSquares(5);
    return Container(
      width: sizeX,
      height: sizeY,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: x,
      ),
    );
  }

  List<Widget> createSquares(int numSquares) {
    int i = 0;
    List<Color> colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue,
    ];

    List<Widget> squares = [];

    while (i < numSquares) {
      Container square = Container(
        width: 100.0,
        height: 100.0,
        color: colors[i],
        child: Center(
          child: Text(
            i.toString(),
          ),
        ),
      );
      squares.add(square);
    }
    return squares;
  }
}
