import 'package:flutter/material.dart';
import 'package:music_player/recovery.dart';
import 'package:music_player/auth.dart';
import 'package:music_player/reg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:music_player/mainpage.dart';
import 'package:music_player/profilepage.dart';
//import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://vynmxrrrpgghclkifvfa.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ5bm14cnJycGdnaGNsa2lmdmZhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAzODI2ODQsImV4cCI6MjA1NTk1ODY4NH0.M5pbE5EZyjnsmXGQXVw1ewLgSYHAyVVZd1uFi7alHIs',
    authOptions: FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
  );

  final supabase = Supabase.instance.client;
  final session = supabase.auth.currentSession;

  runApp(AppTheme(initialRoute: session != null ? '/main' : '/'));
}

class AppTheme extends StatelessWidget {
  final String initialRoute;

  const AppTheme({super.key, this.initialRoute = '/'});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            foregroundColor: WidgetStatePropertyAll(Colors.blueGrey),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            side: WidgetStatePropertyAll(BorderSide(color: Colors.white)),
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: initialRoute,
      routes: {
        '/': (context) => AuthPage(),
        '/reg': (context) => RegPage(),
        '/recovery': (context) => RecoveryPage(),
        '/main': (context) => MainPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}