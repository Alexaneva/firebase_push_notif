import 'package:flutter/material.dart';

import '../services/firebase_api.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FirebaseApi firebaseApi = FirebaseApi();
  String? token;

  @override
  void initState() {
    super.initState();
    _fetchToken();
  }

  Future<void> _fetchToken() async {
    final fetchedToken = await firebaseApi.getToken();
    setState(() {
      token = fetchedToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  'token: ${token ?? "Loading..."}',
                  style: const TextStyle(color: Colors.black87, fontSize: 15),
                )),
          ],
        ),
      ),
    );
  }
}
