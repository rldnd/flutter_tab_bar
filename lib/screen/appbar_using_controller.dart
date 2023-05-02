import 'package:flutter/material.dart';
import 'package:flutter_tab_bar/const/tabs.dart';

class AppBarUsingController extends StatefulWidget {
  const AppBarUsingController({super.key});

  @override
  State<AppBarUsingController> createState() => _AppBarUsingControllerState();
}

// 실제 한 프레임 당 틱이 움직이는 것을 효율적으로 컨트롤 하도록 해줌
class _AppBarUsingControllerState extends State<AppBarUsingController>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: TABS.length, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Using Controller'),
        bottom: TabBar(
          controller: tabController,
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
      body: TabBarView(
        controller: tabController,
        children: TABS
            .map(
              (tab) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(tab.icon),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (tabController.index != 0)
                        ElevatedButton(
                          onPressed: () {
                            tabController.animateTo(tabController.index - 1);
                          },
                          child: const Text('이전'),
                        ),
                      const SizedBox(width: 16.0),
                      if (tabController.index != TABS.length - 1)
                        ElevatedButton(
                          onPressed: () {
                            tabController.animateTo(tabController.index + 1);
                          },
                          child: const Text('다음'),
                        ),
                    ],
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
