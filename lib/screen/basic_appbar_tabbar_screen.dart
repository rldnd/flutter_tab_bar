import 'package:flutter/material.dart';
import 'package:flutter_tab_bar/const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  final List<int> items = List<int>.generate(100, (index) => index);

  BasicAppbarTabbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Basic AppBar TabBar Screen'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    labelColor: Colors.yellow,
                    unselectedLabelColor: Colors.red,
                    indicatorColor: Colors.purple,
                    indicatorWeight: 4.0,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                    tabs: TABS
                        .map(
                          (tab) => Tab(
                            icon: Icon(tab.icon),
                            child: Text(tab.label),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: TABS
              .map(
                (tab) => Center(
                  child: Icon(tab.icon),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
