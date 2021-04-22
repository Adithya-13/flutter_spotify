import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/presentation/utils/app_theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPlaying = false;
  String dummyImage = "https://is5-ssl.mzstatic.com/image/thumb/Music123/v4/f1/78/a4/f178a464-451f-29ea-b1c7-ace674a6f8cc/source/1200x1200bb-60.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 64,
              color: Colors.brown,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 0.5,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Image.network(dummyImage, fit: BoxFit.cover,),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "To the Bone - Pamungkas",
                                  style: AppTheme.mediumWhiteText,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Pamungkas",
                                  style: AppTheme.lightWhiteText,
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconTheme(
                          data: AppTheme.whiteMediumIcon,
                          child: Row(
                            children: [
                              Icon(Icons.laptop),
                              SizedBox(width: 8),
                              Icon(Icons.favorite_border_rounded),
                              SizedBox(width: 8),
                              Icon(Icons.pause),
                              SizedBox(width: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
