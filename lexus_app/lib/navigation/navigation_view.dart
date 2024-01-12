import 'package:flutter/material.dart';
import 'package:lexus_app/chatgpt/chatgpt_view.dart';
import 'package:lexus_app/home/home_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

var _controller = PersistentTabController();

class _NavigationViewState extends State<NavigationView> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    List<Widget> _buildScreens() =>
        [HomeView(), const ChatScreen(), HomeView(), HomeView()];
    return Container(
      color: Colors.grey[300],
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: PersistentTabView(
            context,
            screens: _buildScreens(),
            controller: _controller,
            items: navBarItems(),
            backgroundColor: Colors.white,
            hideNavigationBarWhenKeyboardShows: true,
            popAllScreensOnTapOfSelectedTab: true,
            navBarStyle: NavBarStyle.style9,
          ),
        ),
      ),
    );
  }
}
