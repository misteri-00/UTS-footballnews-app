import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';
import 'login_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'Football Info App',
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme, // Tema dinamis berdasarkan Dark Mode
      home: LoginPage(), // Halaman pertama adalah LoginPage
    );
  }
}
