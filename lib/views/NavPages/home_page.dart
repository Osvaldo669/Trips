import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/tools/resolution.dart';
import 'package:flutter_cubit/widgets/text_appLarge.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final Resolution resolution = Resolution(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red),
                )
              ],
            ),
          ),
          SizedBox(
            height: resolution.dp(3),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            child: AppLargeText(
                text: 'Descubre',
                color: AppColors.bigTextColor,
                size: resolution.dp(2.5)),
          ),
          SizedBox(
            height: resolution.dp(3),
          ),
          Container(
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.blueGrey.shade900,
              unselectedLabelColor: Colors.blueGrey.shade200,
              //isScrollable: true,
              tabs: [
                Tab(
                  text: 'Lugares',
                ),
                Tab(
                  text: 'Inspiration',
                ),
                Tab(
                  text: 'Emociones',
                )
              ],
            ),
          ),
          Container(
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                  controller: _tabController,
                  children: [Text('Hola'), Text('2'), Text('3')]))
        ],
      ),
    );
  }
}
