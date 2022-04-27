import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/tools/resolution.dart';
import 'package:flutter_cubit/widgets/text_appLarge.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int startsC = 4;
  @override
  Widget build(BuildContext context) {
    final Resolution resolution = Resolution(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                child: Container(
              width: double.maxFinite,
              height: resolution.dp(25),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('img/welcome-three.png'))),
            )),
            Positioned(
                child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.keyboard_return_rounded), onPressed: () {})
              ],
            )),
            Positioned(
                top: resolution.dp(20),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  width: resolution.width,
                  height: resolution.dp(70),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                              text: 'Yosemite',
                              color: AppColors.mainColor,
                              size: resolution.dp(4)),
                          AppLargeText(
                              text: '\$300',
                              color: Colors.grey,
                              size: resolution.dp(2))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.deepPurple.shade600,
                          ),
                          Text(
                            'USA, California',
                            style: TextStyle(color: Colors.deepPurple.shade600),
                          )
                        ],
                      ),
                      Center(
                        child: Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star_rounded,
                                      color: index < startsC
                                          ? AppColors.starColor
                                          : Colors.grey,
                                    ))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 5),
                        child: AppLargeText(
                            text: 'People',
                            color: Colors.black,
                            size: resolution.dp(3)),
                      ),
                      Container(
                        child: AppLargeText(
                            text:
                                'There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..',
                            color: Colors.blueGrey.shade800,
                            size: resolution.dp(1.5)),
                      ),
                      Container(
                        child: Wrap(
                          children: List.generate(
                              5,
                              (index) => Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 20),
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: Text((index + 1).toString()),
                                    ),
                                  )),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
