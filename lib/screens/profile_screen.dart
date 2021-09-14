import 'package:flutter/material.dart';
import 'package:flutter_clone_intagram/contants.dart';
import 'package:flutter_clone_intagram/models/user.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;
  const ProfileScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: usersRef.doc(widget.userId).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData || !snapshot.data.exists) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // print(snapshot.data['bio']);
          User user = User.fromDoc(snapshot.data);
          print("name: " + user.name);
          print("email: " + user.email);
          print("bio: " + user.bio);
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                        "https://bizweb.dktcdn.net/100/340/942/products/rose-royale.jpg?v=1561088018857",
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "12",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    "posts",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                          fontSize: 18.0,
                                          color: Colors.black54,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "122",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    "follower",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                          fontSize: 18.0,
                                          color: Colors.black54,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "122",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    "following",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                          fontSize: 18.0,
                                          color: Colors.black54,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 200.0,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(
                                  TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.blue,
                                ),
                              ),
                              child: Text("Edit Profile"),
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   child: Text('Button'),
                          //   style: ElevatedButton.styleFrom(
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(12), // <-- Radius
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "abc",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: Text(
                        "Bioooooooooooooooooooooooooooooooooooooooooooooooooo",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
