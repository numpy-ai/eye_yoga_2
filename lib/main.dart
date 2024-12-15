import 'package:eye_yoga_2/screen/notice.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EyeYogaScreen(),
    );
  }
}

class EyeYogaScreen extends StatefulWidget {
  const EyeYogaScreen({super.key});
  
  @override
  State<EyeYogaScreen> createState() => _EyeYogaScreenState();
}

// 1-1 첫화면 (앱 실행) => 1-2 화면으로 로딩 2초 구현
class _EyeYogaScreenState extends State<EyeYogaScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NoticeScreen()),
      );
    });
  }

  // 1-1 첫 화면 (앱 실행 화면)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Eye Yoga',
        ),
      ),
      body: const Center(
        child: Text(
          'Eye Yoga',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
