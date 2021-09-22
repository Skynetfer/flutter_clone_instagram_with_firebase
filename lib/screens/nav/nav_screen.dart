import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clone_intagram/enums/enums.dart';
import 'package:flutter_clone_intagram/screens/nav/component/tab_navigator.dart';
import 'package:flutter_clone_intagram/screens/nav/component/widget_nav_items.dart';
import 'package:flutter_clone_intagram/screens/nav/cubit/bottom_nav_bar_cubit.dart';

class NavScreen extends StatelessWidget {
  static const String routeName = "/nav";
  static Route route() {
    return PageRouteBuilder(
        pageBuilder: (_, __, ___) => BlocProvider<BottomNavBarCubit>(
            create: (_) => BottomNavBarCubit(), child: NavScreen()),
        settings: RouteSettings(name: routeName),
        transitionDuration: Duration(seconds: 0));
  }

  final Map<BottomNavItems, GlobalKey<NavigatorState>> navigatorKeys = {
    BottomNavItems.feed: GlobalKey<NavigatorState>(),
    BottomNavItems.search: GlobalKey<NavigatorState>(),
    BottomNavItems.create: GlobalKey<NavigatorState>(),
    BottomNavItems.notification: GlobalKey<NavigatorState>(),
    BottomNavItems.profile: GlobalKey<NavigatorState>(),
  };

  final Map<BottomNavItems, IconData> items = const {
    BottomNavItems.feed: Icons.home,
    BottomNavItems.search: Icons.search,
    BottomNavItems.create: Icons.add,
    BottomNavItems.notification: Icons.favorite_border,
    BottomNavItems.profile: Icons.account_circle,
  };
  NavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: items
                  .map((item, _) => MapEntry(
                        item,
                        _buildOffstageNavigator(
                          item,
                          item == state.selectedItem,
                        ),
                      ))
                  .values
                  .toList(),
            ),
            bottomNavigationBar: BottomNavBar(
              items: items,
              onTap: (index) {
                final selectedItem = BottomNavItems.values[index];
                context
                    .read<BottomNavBarCubit>()
                    .updateSelectedItem(selectedItem);
                _selectBottomNavItem(
                  context,
                  selectedItem,
                  selectedItem == state.selectedItem,
                );
              },
              selectedItem: state.selectedItem,
            ),
          );
        },
      ),
    );
  }

  void _selectBottomNavItem(
      BuildContext context, BottomNavItems selectedItem, bool isSameItem) {
    if (isSameItem) {
      //feed screen --> Post's comments
      navigatorKeys[selectedItem]!
          .currentState!
          .popUntil((route) => route.isFirst);
    }
    context.read<BottomNavBarCubit>().updateSelectedItem(selectedItem);
  }

  Widget _buildOffstageNavigator(
    BottomNavItems currentItem,
    bool isSelected,
  ) {
    return Offstage(
      offstage: !isSelected,
      child: TabNavigator(
        navigatorKey: navigatorKeys[currentItem]!,
        item: currentItem,
      ),
    );
  }
}
