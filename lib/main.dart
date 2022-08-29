import 'package:flutter/material.dart';
import 'package:productivity_timer/screens/productivity_timer_screen.dart';
import 'package:productivity_timer/widgets/timer.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: TimerModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Productivity Timer',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: const ProductivityTimerScreen(),
        ),
    );
  }
}
