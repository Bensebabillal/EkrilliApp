import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.title,
    this.margin,
  }) : super(key: key);

  final String title;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Text(
        title,
        style: Get.theme.textTheme.headline6,
      ),
    );
  }
}
