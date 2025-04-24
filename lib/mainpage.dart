import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text('Главная'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: Icon(Icons.person, color: Colors.white, size: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  style: TextStyle(color: Colors.blueGrey[600]),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.search, color: Colors.blueGrey[600]),
                    labelText: 'Поиск',
                    labelStyle: TextStyle(color: Colors.blueGrey[600]),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Плейлисты",
                    style: TextStyle(fontSize: 32),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blueGrey[200],
                            ),
                            child: Center(child: Text("Плейлист ${index + 1}")),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Популярные исполнители",
                    style: TextStyle(fontSize: 32),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.blueGrey[200],
                            child: Text("${index + 1}"),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Альбомы",
                    style: TextStyle(fontSize: 32),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blueGrey[200],
                            ),
                            child: Center(child: Text("Альбом ${index + 1}")),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.blueGrey[600],
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.music_note, color: Colors.white, size: 40),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Название трека",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "Исполнитель",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.play_arrow, color: Colors.white, size: 40),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey[600],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 40),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.2),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward, color: Colors.white, size: 40),
            ),
          ],
        ),
      ),
    );
  }
}