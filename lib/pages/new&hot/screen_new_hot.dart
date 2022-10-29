import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/new&hot/widgets/coming_soon.dart';
import 'package:netflix_clone/pages/new&hot/widgets/everyones_watching.dart';

import '../widgets/app_bar_widget.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarWidget(
          height: 80,
          title: 'Hot & New',
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            isScrollable: true,
            tabs: const [
              Tab(
                text: '🍿 Coming soon',
              ),
              Tab(
                text: '👀 Everyone\'s watching',
              ),
            ],
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ComingSoonWidget(),
            const EveryonesWatchingWidget(),
          ],
        ),
      ),
    );
  }
}
