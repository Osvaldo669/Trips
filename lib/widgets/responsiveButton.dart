import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width, height;
  ResponsiveButton({Key? key, this.width, this.isResponsive, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColors.mainColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isResponsive == true
              ? Text(
                  'Comprar ahora',
                  style: TextStyle(color: Colors.white),
                )
              : Text(''),
          Image.asset(
            'img/button-one.png',
          )
        ],
      ),
    );
  }
}
