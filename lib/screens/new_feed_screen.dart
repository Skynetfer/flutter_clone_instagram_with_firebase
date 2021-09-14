import 'package:flutter/material.dart';
import 'package:flutter_clone_intagram/services/auth_service.dart';

class NewFeedScreen extends StatefulWidget {
  static final String id = "/new_feed";
  const NewFeedScreen({Key? key}) : super(key: key);

  @override
  _NewFeedScreenState createState() => _NewFeedScreenState();
}

class _NewFeedScreenState extends State<NewFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => AuthService.signOut(),
                child: Text(
                  "SIGNOUT",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
