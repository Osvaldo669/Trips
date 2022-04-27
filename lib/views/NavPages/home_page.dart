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
    List images = [
      'balloning',
      'hiking',
      'kayaking',
      'snorkling',
    ];
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
              indicator: CircleIndicator(color: AppColors.mainColor, radius: 5),
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
              width: double.maxFinite,
              height: 300,
              child: TabBarView(controller: _tabController, children: [
                ListView.builder(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: resolution.dp(15),
                        height: resolution.dp(35),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(
                                  'img/mountain.jpeg',
                                ),
                                fit: BoxFit.cover)),
                      );
                    }),
                Text('2'),
                Text('3')
              ])),
          Container(
            padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                    text: 'Explora Más',
                    color: Colors.black,
                    size: resolution.dp(2)),
                AppLargeText(
                    text: 'Mirar Todo',
                    color: Colors.grey,
                    size: resolution.dp(1.7))
              ],
            ),
          ),
          Container(
              height: resolution.dp(13),
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 50),
                          width: resolution.dp(10),
                          height: resolution.dp(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                    'img/' + images[index] + '.png',
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 50),
                          child: Text(
                            images[index],
                            style: TextStyle(
                                color: Colors.blueAccent.shade700,
                                fontFamily: 'fontShadow',
                                fontWeight: FontWeight.w300,
                                fontSize: resolution.dp(1.4)),
                          ),
                        )
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}

class CircleIndicator extends Decoration {
  final Color color;
  double radius;
  CircleIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _circlePainter(color: color, radius: radius);
  }
}

class _circlePainter extends BoxPainter {
  final Color color;
  double radius;
  _circlePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circle_offset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius / 2);
    canvas.drawCircle(offset + circle_offset, radius, _paint);
  }
}
