import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cubit/tools/resolution.dart';
import 'package:flutter_cubit/widgets/text_appLarge.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];
  @override
  Widget build(BuildContext context) {
    final Resolution resolution = new Resolution(context);
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('img/' + images[index]))),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        AppLargeText(
                            text: 'Viajes',
                            color: Colors.black,
                            size: resolution.dp(5.5))
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
