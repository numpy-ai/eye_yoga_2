import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:eye_yoga_2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override 
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  int totalTime = 20;
  late Timer timer;
  bool isRunning = false;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playSound() async {
    try {
      await _audioPlayer.play(AssetSource("1.mp3"));
      print("실행 성공");
    } catch (e) {
      print("실행 실패");
    }
  }

  void onTick(Timer timer) {
    if (totalTime == 0) {
      setState(() {
        _playSound();
        isRunning = false;
      });
      timer.cancel();
    } else {
      setState(() {
        totalTime -= 1;
      });
    }
  }

  void onStartPressed() {
    if (!isRunning) {
      timer = Timer.periodic(const Duration(seconds: 1), onTick);
      setState(() {
        isRunning = true;
      });
    }
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eye Yoga')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 125),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "시계 방향으로 안구를 돌리세요.",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '$totalTime',
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: isRunning ? onPausePressed : onStartPressed,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: Text(
                  isRunning ? '일시 정지' : '타이머 시작',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 250),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                // 이전 버튼
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    Text('이전'),
                  ],
                ),
              ),
              const SizedBox(width: 150),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                onPressed: () {
                  if (isRunning) {
                    timer.cancel();
                  }
                  setState((){
                    totalTime = 20;
                    isRunning = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FifthScreen())
                    );
                },

                // 다음 버튼
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('다음'),
                    Icon(
                      Icons.arrow_forward,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FifthScreen extends StatefulWidget {
 const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  int totalTime = 20;
  late Timer timer;
  bool isRunning = false;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playSound() async {
    try {
      await _audioPlayer.play(AssetSource("1.mp3"));
      print("실행 성공");
    } catch (e) {
      print("실행 실패");
    }
  }

  void onTick(Timer timer) {
    if (totalTime == 0) {
      setState(() {
        _playSound();
        isRunning = false;
      });
      timer.cancel();
    } else {
      setState(() {
        totalTime -= 1;
      });
    }
  }

  void onStartPressed() {
    if (!isRunning) {
      timer = Timer.periodic(const Duration(seconds: 1), onTick);
      setState(() {
        isRunning = true;
      });
    }
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eye Yoga')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 125),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "반시계 방향으로 안구를 돌리세요.",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '$totalTime',
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: isRunning ? onPausePressed : onStartPressed,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: Text(
                  isRunning ? '일시 정지' : '타이머 시작',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 250),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                // 이전 버튼
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    Text('이전'),
                  ],
                ),
              ),
              const SizedBox(width: 150),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                onPressed: () {
                  if (isRunning) {
                    timer.cancel();
                  }
                  setState((){
                    totalTime = 20;
                    isRunning = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SixthScreen())
                    );
                },

                // 다음 버튼
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('다음'),
                    Icon(
                      Icons.arrow_forward,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
 }
}

class SixthScreen extends StatefulWidget {
  @override
  State<SixthScreen> createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen> {

  int totalTime = 20;
  late Timer timer;
  bool isRunning = false;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playSound() async {
    try {
      await _audioPlayer.play(AssetSource("1.mp3"));
      print("실행 성공");
    } catch (e) {
      print("실행 실패");
    }
  }

  void onTick(Timer timer) {
    if (totalTime == 0) {
      setState(() {
        _playSound();
        isRunning = false;
      });
      timer.cancel();
    } else {
      setState(() {
        totalTime -= 1;
      });
    }
  }

  void onStartPressed() {
    if (!isRunning) {
      timer = Timer.periodic(const Duration(seconds: 1), onTick);
      setState(() {
        isRunning = true;
      });
    }
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eye Yoga')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 125),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "눈을 감으세요.",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '$totalTime',
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: isRunning ? onPausePressed : onStartPressed,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: Text(
                  isRunning ? '일시 정지' : '타이머 시작',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 250),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                // 이전 버튼
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    Text('이전'),
                  ],
                ),
              ),
              const SizedBox(width: 150),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                onPressed: () {
                  if (isRunning) {
                    timer.cancel();
                  }
                  setState((){
                    totalTime = 20;
                    isRunning = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EndScreen())
                    );
                },

                // 다음 버튼
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [ 
                    Text('운동\n완료'),
                    Icon(
                      Icons.arrow_forward,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EndScreen extends StatefulWidget {
  const EndScreen({super.key});

  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {

  void _closeApp() {
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 500),
          ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),  
                  onPressed: () { 
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EyeYogaScreen())
                      );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('다시 시작'),
                    ],
                  ),
                ),
                const SizedBox(width: 200),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
      
                  onPressed: _closeApp,
      
                  // 다음 버튼
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('앱 종료'),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}