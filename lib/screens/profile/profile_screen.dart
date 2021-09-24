import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clone_intagram/blocs/blocs.dart';
import 'package:flutter_clone_intagram/screens/profile/component/profile_info.dart';
import 'package:flutter_clone_intagram/screens/profile/component/profile_stats.dart';
import 'package:flutter_clone_intagram/screens/profile/component/user_profile_image.dart';
import 'package:flutter_clone_intagram/widgets/widgets.dart';

import 'bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.status == ProfileStatus.error) {
          showDialog(
            context: context,
            builder: (context) => ErrorDialog(
              content: state.failure.message,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                state.user.username,
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                if (state.isCurrentUser)
                  IconButton(
                    onPressed: () => context.read<AuthBloc>().add(
                          AuthSignOutRequested(),
                        ),
                    icon: Icon(Icons.exit_to_app),
                  )
              ],
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 0),
                        child: Row(
                          children: [
                            UserProfileImage(
                              radius: 40.0,
                              profileImageUrl: state.user.profileImageUrl,
                            ),
                            ProfileStats(
                              isCurrentUser: state.isCurrentUser,
                              isFollowing: state.isFollowing,
                              posts: 0,
                              followers: state.user.followers,
                              following: state.user.following,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        child: ProfileInfo(
                          username: state.user.username,
                          bio: state.user.bio,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}
