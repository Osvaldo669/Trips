import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/tools/resolution.dart';
import 'package:flutter_cubit/widgets/responsiveButton.dart';
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
          itemBuilder: (_, indexDots) {
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('img/' + images[indexDots]))),
              child: Container(
                margin: const EdgeInsets.only(top: 90, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(
                            text: 'VIAJES',
                            color: Colors.black,
                            size: resolution.dp(5.5)),
                        Text(
                          'Montañas',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: resolution.dp(3.8),
                              fontFamily: 'fontShadow',
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(height: resolution.hp(2)),
                        Container(
                          width: resolution.wp(40),
                          child: Text(
                            'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
                            style: TextStyle(
                                color: AppColors.textColor2,
                                fontFamily: 'fontShadow',
                                fontSize: resolution.hp(1.8)),
                          ),
                        ),
                        SizedBox(height: resolution.hp(4)),
                        GestureDetector(
                          onTap: () {
                            //Se utiliza bloc para el manejo de los estados
                            BlocProvider.of<AppCubits>(context)
                                .getData(); //Invocamos el metodo para llamar a la api
                          },
                          child: Container(
                            child: ResponsiveButton(
                              width: resolution.dp(12),
                              height: resolution.dp(5),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (index) {
                        return Container(
                          margin: EdgeInsets.only(top: 3, bottom: 3),
                          width: 8,
                          height: index == indexDots
                              ? resolution.hp(10)
                              : resolution.hp(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : Colors.blueGrey,
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
