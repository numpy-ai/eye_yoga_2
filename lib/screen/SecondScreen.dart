import 'dart:async';

import 'package:eye_yoga_2/screen/ThirdScreen.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
      print(e);
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "눈을 깜빡이세요.",
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
          const SizedBox(height: 300),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
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
                    Text(
                      '이전',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                    MaterialPageRoute(builder: (context) => const ThirdScreen())
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
