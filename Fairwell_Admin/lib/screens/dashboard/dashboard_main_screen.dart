import 'package:Fairwell_Admin/screens/dashboard/dashboard_tab/dashboard_tab_screen.dart';
import 'package:Fairwell_Admin/screens/dashboard/dashboard_tab/more_stats_screen.dart';
import 'package:Fairwell_Admin/screens/dashboard/orders_tab/orders_tab_screen.dart';
import 'package:Fairwell_Admin/screens/dashboard/post_tab.dart/post_tab_screen.dart';
import 'package:Fairwell_Admin/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'chat_tab/chat_screen.dart';
import 'post_tab.dart/edit_post_screen.dart';
import 'orders_tab/order_details/order_details_screen.dart';

class DashboardMainScreen extends StatefulWidget {
  DashboardMainScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DashboardMainScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  Tab _bottomBarNavigation(String assetName) {
    return Tab(
      icon: Image(
        image: AssetImage(assetName),
      ),
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    if (_tabController != null) {
      _tabController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dashboard',
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.blue,
        tabs: [
          _bottomBarNavigation('resources/images/ic_speedometer.png'),
          _bottomBarNavigation('resources/images/ic_shopping_cart.png'),
          _bottomBarNavigation('resources/images/ic_posts.png'),
          _bottomBarNavigation('resources/images/ic_chat.png'),
        ],
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          DashboardTabScreen(),
          OrdersTabScreen(),
          PostTabScreen(),
          ChatScreen(),
        ],
      ),
    );
  }
}
