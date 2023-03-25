import 'package:flutter/material.dart';
import 'package:quiz_tpm/Pages/halaman_utama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HalamanUtama(),
      debugShowCheckedModeBanner: false
    );
  }
}
