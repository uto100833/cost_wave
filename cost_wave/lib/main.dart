import 'package:cost_wave/screen/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cost Wave',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0xFF00ACC1), // ロゴのブルーに近い色
          secondary: Color(0xFF80CBC4), // ロゴのグリーンに近い色
          surface: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          brightness: Brightness.dark,
          error: Colors.red,
          onError: Colors.white,
        ), // 背景色をダークブルーグレーに設定
        useMaterial3: true,
      ),
      home: const SigninPage(),
    );
  }
}
