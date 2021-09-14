import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_clone_intagram/screens/create_post_screen.dart';
import 'package:flutter_clone_intagram/screens/new_feed_screen.dart';
import 'package:flutter_clone_intagram/screens/profile_screen.dart';
import 'package:flutter_clone_intagram/screens/search_screen.dart';

import '../contants.dart';
import 'activity_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userId;

  const HomeScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController? _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Clone Instagram",
          style: TextStyle(
            color: Theme.of(context).buttonColor,
            fontFamily: 'Billabong',
            fontSize: kHeadlineHome,
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          NewFeedScreen(),
          SearchScreen(),
          CreatePostScreen(),
          ActivityScreen(),
          ProfileScreen(
            userId: widget.userId,
          ),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        onTap: (int index) {
          setState(() {
            _currentTab = index;
          });
          _pageController!.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
        activeColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_camera,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
          ),
        ],
      ),
    );
  }
}
