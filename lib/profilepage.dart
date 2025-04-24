import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _supabase = Supabase.instance.client;
  Map<String, dynamic>? _userData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
  try {
    final email = _supabase.auth.currentUser?.email;

    if (email != null) {
      print('Email пользователя: $email');

      final response = await _supabase
          .from('User')
          .select('Login_User, Email_User')
          .eq('Email_User', email)
          .maybeSingle();

      print('Данные из базы: $response');

      if (response != null) {
        setState(() {
          _userData = response;
          _isLoading = false;
        });
      } else {
        print('Пользователь с email $email не найден'); 
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      print('Пользователь не авторизован');
      setState(() {
        _isLoading = false;
      });
    }
  } catch (e) {
    print('Ошибка при загрузке данных: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Ошибка при загрузке данных: $e')),
    );
    setState(() {
      _isLoading = false;
    });
  }
}


  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Профиль'),
      backgroundColor: Colors.blueGrey[600],
    ),
    body: _isLoading
        ? const Center(child: CircularProgressIndicator())
        : _userData == null
            ? const Center(child: Text('Данные пользователя не найдены'))
            : Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.blueGrey[200],
                          child: _userData?['Avatar_User'] != null
                              ? ClipOval(
                                  child: Image.network(
                                    _userData!['Avatar_User'],
                                    width: 160,
                                    height: 160,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const Icon(
                                  Icons.person,
                                  size: 80,
                                  color: Colors.white,
                                ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          _userData?['Login_User'] ?? 'Нет никнейма',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          _userData?['Email_User'] ?? 'Нет почты',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blueGrey[300],
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: const Text('Редактировать профиль'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
  );
}
}