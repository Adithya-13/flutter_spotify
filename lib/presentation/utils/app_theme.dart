import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

String dummyImage = "https://is5-ssl.mzstatic.com/image/thumb/Music123/v4/f1/78/a4/f178a464-451f-29ea-b1c7-ace674a6f8cc/source/1200x1200bb-60.jpg";

Future<Color> getImagePalette (ImageProvider imageProvider) async {
  final PaletteGenerator paletteGenerator = await PaletteGenerator
      .fromImageProvider(imageProvider);
  return paletteGenerator.dominantColor!.color;
}

class AppTheme {
  static Color darkGrey = Color(0XFFB3B3B3);
  static Color mortar = Color(0XFF535353);
  static Color black = Color(0XFF111111);
  static Color nero = Color(0XFF282828);
  static Color mountainMeadow = Color(0XFF1DB954);

  ///////////////////////// TEXT /////////////////////////

  static TextStyle boldSmallWhiteText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  static TextStyle lightSmallWhiteText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w100,
    fontSize: 12,
  );

  static TextStyle boldBigWhiteText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  static TextStyle boldVeryBigWhiteText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 26,
  );

  static TextStyle boldNormalBlackText = TextStyle(
    color: black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static TextStyle boldNormalWhiteText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  ///////////////////////// ICON /////////////////////////

  static IconThemeData bigWhiteIcon = IconThemeData(
    color: Colors.white,
    size: 28,
  );

  static IconThemeData normalWhiteIcon = IconThemeData(
    color: Colors.white,
    size: 24,
  );

}
