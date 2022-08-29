import 'package:flutter/material.dart';
import 'package:flutter_application_2/ListAllFootball.dart';
import 'package:flutter_application_2/listLegueSpain.dart';
import 'package:flutter_application_2/spainlegue.dart';
class tabs extends StatefulWidget {
  const tabs({Key? key}) : super(key: key);

  @override
  State<tabs> createState() => _tabsState();
}

class _tabsState extends State<tabs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "legue english",),
                Tab(text: "legue Spain",),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text(' Club Bola'),
          ),
          body: const TabBarView(
            children: [
              ListAllFootbal(),
              spainlegue(),

              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
