import 'package:eye_yoga_2/screen/FirstScreen.dart';
import 'package:flutter/material.dart';

// 1-2 안내문 읽기 화면
class NoticeScreen extends StatelessWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Eye Yoga'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 150),
                const Text(
                  '이 앱은 사용자의 안구 운동을 도와주는 앱 입니다.',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 350),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NextScreen()),
                    );
                  },

                  // 다음 버튼
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
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
          ),
        )
      );
  }
}