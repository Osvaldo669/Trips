import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/cubit/app_states_cubit.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/tools/resolution.dart';
import 'package:flutter_cubit/widgets/appButton.dart';
import 'package:flutter_cubit/widgets/responsiveButton.dart';
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
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detailState = state as DetailState;
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
                        image: NetworkImage(
                            'http://mark.bslmeiyu.com/uploads/' +
                                detailState.place.img))),
              )),
              Positioned(
                  child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.keyboard_return_rounded),
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      })
                ],
              )),
              Positioned(
                  top: resolution.dp(20),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                                text: detailState.place.name,
                                color: AppColors.mainColor,
                                size: resolution.dp(4)),
                            AppLargeText(
                                text: '\$' + detailState.place.price.toString(),
                                color: Colors.grey,
                                size: resolution.dp(3))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.deepPurple.shade600,
                            ),
                            Text(
                              detailState.place.location,
                              style:
                                  TextStyle(color: Colors.deepPurple.shade600),
                            )
                          ],
                        ),
                        Center(
                          child: Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Icon(
                                        Icons.star_rounded,
                                        color: index < detailState.place.stars
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
                          margin: EdgeInsets.only(top: 10),
                          child: Wrap(
                            children: List.generate(
                                5,
                                (index) => AppButton(
                                      margin: 15,
                                      color: AppColors.buttonBackground,
                                      text: (index + 1).toString(),
                                    )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: AppLargeText(
                              text: 'Descripcion',
                              color: Colors.black,
                              size: resolution.dp(2.5)),
                        ),
                        AppLargeText(
                            text: detailState.place.description,
                            color: Colors.grey,
                            size: resolution.dp(1.5)),
                      ],
                    ),
                  )),
              Positioned(
                left: 15,
                bottom: 10,
                width: resolution.width - 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      margin: 0,
                      color: Colors.white,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    ResponsiveButton(
                      isResponsive: true,
                      width: resolution.dp(25),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
