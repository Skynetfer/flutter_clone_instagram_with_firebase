import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final bool isCurrentUser;
  final bool isFollowing;
  const ProfileButton({
    Key? key,
    required this.isCurrentUser,
    required this.isFollowing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCurrentUser
        ? ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              "Edit Profile",
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                // <-- Radius
              ),
            ),
          )
        : TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: isFollowing
                  ? Colors.grey[300]
                  : Theme.of(context).primaryColor,
            ),
            child: Text(
              isFollowing ? "Unfollow" : "Follow",
              style: TextStyle(
                fontSize: 16.0,
                color: isFollowing ? Colors.black : Colors.white,
              ),
            ),
          );
  }
}
