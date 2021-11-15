import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ImageCoverWidget extends StatelessWidget {
  final String assetLink;
  const ImageCoverWidget({Key? key, required this.assetLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        assetLink,
        fit: BoxFit.cover,
      height: Get.height/2.5,
      width: Get.width,
    );
  }
}
