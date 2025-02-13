import 'package:flutter/material.dart';
import 'waitlist_tab1.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Watchlist",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            isScrollable: true,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: "Watchlist 1"),
              Tab(text: "Watchlist 2"),
              Tab(text: "Watchlist 3"),
              Tab(text: "Watchlist 4"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WatchlistTab(),
            Center(child: Text("Watchlist 2")),
            Center(child: Text("Watchlist 3")),
            Center(child: Text("Watchlist 4")),
          ],
        ),
      ),
    );
  }
}
