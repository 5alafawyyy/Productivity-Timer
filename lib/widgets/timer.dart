import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:keep_screen_on/keep_screen_on.dart';
import 'package:scoped_model/scoped_model.dart';

class TimerModel extends Model {
  Duration _time = const Duration(minutes: 25, seconds: 0,);
  late Duration _fullTime;
  double _radius = 1;

  Timer timer = Timer.periodic(const Duration(seconds: 1),(timer) {});
  String get time => returnTime(_time);
  double get radius => returnRadius(_radius);

  double returnRadius(double radius) {
    return radius;
  }

  String returnTime(Duration t) {
    AssetsAudioPlayer player = AssetsAudioPlayer();
    if (t.inSeconds <= 0) {
      _time = const Duration(minutes: 0, seconds: 0);
      //play sound using assets_audio_player
      player.open(Audio(
        "assets/sounds/dong.mp3",
      ));
      player.play();
      stopTimer();
    }
    String ts = t.toString();
    String minutes = ts.substring(2, 4);
    String seconds = ts.substring(5, 7);
    String formattedTime = "$minutes:$seconds";
    return formattedTime;
  }

  void decrementTime() {
    if (_time.inSeconds > 0) {
      _time = _time - const Duration(seconds: 1);
      _radius = _time.inSeconds / _fullTime.inSeconds;
    } else {
      _time = const Duration(seconds: 0);
      _radius = 0;
      stopTimer();
    }
    notifyListeners();
  }

  void startPomodoro() {
    // Prevent screen from going into sleep mode:
    KeepScreenOn.turnOn(true);
    _radius = 1;
    _time = const Duration(minutes: 25, seconds: 0);
    notifyListeners();
    _fullTime = _time;
    startTimer(25);
  }

  void startShort() {
    KeepScreenOn.turnOn(true);
    _radius = 1;
    _time = const Duration(minutes: 5, seconds: 0);
    notifyListeners();
    _fullTime = _time;
    startTimer(5);
  }

  void startLong() {
    KeepScreenOn.turnOn(true);
    _radius = 1;
    _time = const Duration(minutes: 20, seconds: 0);
    notifyListeners();
    _fullTime = _time;
    startTimer(20);
  }

  void startTimer(int minutes) {
    stopTimer();
    timer =
        Timer.periodic(const Duration(seconds: 1), (timer) => decrementTime());
  }

  void stopTimer() {
    if (timer.isActive) {
      timer.cancel();
    }
    KeepScreenOn.turnOn(false);
  }

  void restart() {
    if (_time.inSeconds > 0) {
      KeepScreenOn.turnOn(true);
      timer = Timer.periodic(
          const Duration(seconds: 1), (timer) => decrementTime());
    }
  }
}
