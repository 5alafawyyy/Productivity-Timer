import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:productivity_timer/widgets/timer.dart';
import 'package:productivity_timer/widgets/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductivityTimerScreen extends StatefulWidget {
  const ProductivityTimerScreen({super.key});

  @override
  State<ProductivityTimerScreen> createState() =>
      _ProductivityTimerScreenState();
}

class _ProductivityTimerScreenState extends State<ProductivityTimerScreen> {
  Duration time = const Duration(minutes: 30, seconds: 0);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    final buttonWidth3 = sizeX / 3.3;
    final buttonWidth2 = sizeX / 2.15;
    final buttonHeight = sizeY / 18;

    return ScopedModel(
      model: TimerModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Productivity Timer'),
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ScopedModelDescendant<TimerModel>(
                    builder: (context, _, model) => TomatoButton(
                      color: Colors.red,
                      text: "Pomodoro",
                      size: buttonWidth3,
                      onPressed: model.startPomodoro,
                    ),
                  ),
                  ScopedModelDescendant<TimerModel>(
                    builder: (context, _, model) => TomatoButton(
                      color: Colors.lightGreen,
                      text: 'Short Break',
                      size: buttonWidth3,
                      onPressed: model.startShort,
                    ),
                  ),
                  ScopedModelDescendant<TimerModel>(
                    builder: (context, _, model) => TomatoButton(
                      color: Colors.green[700]!,
                      text: 'Long Break',
                      onPressed: model.startLong,
                      size: buttonWidth3,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: ScopedModelDescendant<TimerModel>(
                builder: (context, _, model) => CircularPercentIndicator(
                  radius: 100.0,
                  lineWidth: 10.0,
                  percent: model.radius,
                  center: Text(
                    model.time,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  progressColor: Colors.green,
                ),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ScopedModelDescendant<TimerModel>(
                    builder: (context, _, model) => TomatoButton(
                      color: Colors.red,
                      text: "Stop",
                      onPressed: model.stopTimer,
                      size: buttonWidth2,
                    ),
                  ),
                  ScopedModelDescendant<TimerModel>(
                    builder: (context, _, model) => TomatoButton(
                      color: Colors.lightGreen,
                      text: "Restart",
                      onPressed: model.restart,
                      size: buttonWidth2,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}




// Container(
//           height: sizeY,
//           width: sizeX,
//           padding: const EdgeInsets.symmetric(
//             vertical: 2.0,
//             horizontal: 8.0,
//           ),
//           child: Column(children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                       Colors.deepOrange,
//                     ),
//                     fixedSize: MaterialStateProperty.all(
//                       Size(
//                         buttonWidth3,
//                         buttonHeight,
//                       ),
//                     ),
//                   ),
//                   child: const Text('Work'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                       Colors.lightGreen,
//                     ),
//                     fixedSize: MaterialStateProperty.all(
//                       Size(
//                         buttonWidth3,
//                         buttonHeight,
//                       ),
//                     ),
//                   ),
//                   child: const Text('Short Break'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                       Colors.green[700],
//                     ),
//                     fixedSize: MaterialStateProperty.all(
//                       Size(
//                         buttonWidth3,
//                         buttonHeight,
//                       ),
//                     ),
//                   ),
//                   child: const Text('Long Break'),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Center(
//                 child: CircularPercentIndicator(
//                   radius: sizeY / 7,
//                   lineWidth: 10.0,
//                   progressColor: Colors.green,
//                   center: Text(
//                     '${time.inMinutes}:00',
//                     style: TextStyle(
//                       fontSize: (sizeY / 7) / 3,
//                     ),
//                   ),
//                   percent: 1,
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                       Colors.deepOrange,
//                     ),
//                     fixedSize: MaterialStateProperty.all(
//                       Size(
//                         buttonWidth2,
//                         buttonHeight,
//                       ),
//                     ),
//                   ),
//                   child: const Text('Stop'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                       Colors.lightGreen,
//                     ),
//                     fixedSize: MaterialStateProperty.all(
//                       Size(
//                         buttonWidth2,
//                         buttonHeight,
//                       ),
//                     ),
//                   ),
//                   child: const Text('Restart'),
//                 ),
//               ],
//             ),
//           ]),
//         ),
     





// Center(
//               child: Container(
//                 height: 200.0,
//                 width: 200.0,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.green[700],
//                 ),
//                 child: Center(
//                   child: Container(
//                     height: 180.0,
//                     width: 180.0,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                     ),
//                     child: Center(
//                       child: Text(
//                         '25:00',
//                         style: TextStyle(
//                           color: Colors.grey[500],
//                           fontSize: 40.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
          