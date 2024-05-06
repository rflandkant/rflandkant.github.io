import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'halaman_home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class LikeModel extends ChangeNotifier {
  int _likeCount = 0;
  bool _isLiked = false;

  int get likeCount => _likeCount;
  bool get isLiked => _isLiked;

  // Method untuk menambah jumlah like dan menyimpannya ke penyimpanan lokal
  void incrementLike() async {
    if (_isLiked) {
      _likeCount--;
      _isLiked = false;
    } else {
      _likeCount++;
      _isLiked = true;
    }

    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('likeCount', _likeCount);
    await prefs.setBool('isLiked', _isLiked);
  }

  // Method untuk mengambil jumlah like dari penyimpanan lokal saat aplikasi dimuat
  void loadLikeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _likeCount = prefs.getInt('likeCount') ?? 0;
    _isLiked = prefs.getBool('isLiked') ?? false;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LikeModel()..loadLikeData(),
      child: AdaptiveTheme(
        debugShowFloatingThemeButton: false,
        light: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
        ),
        dark: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'rflandkant',
          theme: theme,
          darkTheme: darkTheme,
          home: HomePage(),
        ),
      ),
    );
  }
}
