import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/couple_list.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      title: 'Couple List',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22),
        ),
        textTheme: GoogleFonts.latoTextTheme(
          const TextTheme(
              // bodyLarge: TextStyle(color: Colors.amber),
              ),
        ),
      ),
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22),
        ),
        brightness: Brightness.dark,
        useMaterial3: true,
        textTheme: const TextTheme(
            // bodyLarge: TextStyle(color: Colors.amber),
            // bodyMedium: TextStyle(color: Colors.blue),
            // bodySmall: TextStyle(color: Colors.brown),
            // titleLarge: TextStyle(color: Colors.red),
            // titleMedium: TextStyle(color: Colors.green),
            // titleSmall: TextStyle(color: Colors.pink),
            // headlineLarge: TextStyle(color: Colors.cyan),
            // headlineMedium: TextStyle(color: Colors.indigo),
            // headlineSmall: TextStyle(color: Colors.teal),
            // displayLarge: TextStyle(color: Colors.teal),
            // displayMedium: TextStyle(color: Colors.teal),
            // displaySmall: TextStyle(color: Colors.teal),
            // labelLarge: TextStyle(color: Colors.teal),
            // labelMedium: TextStyle(color: Colors.teal),
            // labelSmall: TextStyle(color: Colors.teal),
            ),
      ),
      themeMode: ThemeMode.system,
      home: const CoupleList(),
    );
  }
}
