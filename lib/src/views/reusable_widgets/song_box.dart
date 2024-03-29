import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuphonic_front_end/src/app_logics/models/song_model.dart';
import 'package:nuphonic_front_end/src/views/screens/music/music_player.dart';
import 'package:nuphonic_front_end/src/views/utils/consts.dart';

class SongBox extends StatelessWidget {
  final SongModel song;

  SongBox({this.song});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
      child: InkWell(
        onTap: () {
          Get.to(MusicPlayer(
            song: song,
          ));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 97,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  color: textFieldColor,
                  child: Center(
                    child: Icon(
                      Icons.image,
                      color: mainColor,
                      size: 40,
                    ),
                  ),
                ),
                Image.network(
                  song.songImage,
                  width: width,
                  fit: BoxFit.cover,
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(10),
                //   child: Container(
                //     width: width,
                //     height: 97,
                //     child: BackdropFilter(
                //       filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                //       child: Container(
                //         color: Colors.white.withOpacity(0),
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          backgroundColor.withOpacity(0.7),
                        ]),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 5,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              song.songName,
                              style: normalFontStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: whitishColor,
                                  fontSize: 16,
                                  letterSpacing: 0.5),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              song.artistName,
                              style: normalFontStyle.copyWith(
                                fontSize: 13,
                                color: whitishColor.withOpacity(0.7),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(
                                Icons.circle,
                                size: 5,
                                color: whitishColor.withOpacity(0.7),
                              ),
                            ),
                            Text(
                              song.albumName,
                              style: normalFontStyle.copyWith(
                                fontSize: 13,
                                color: whitishColor.withOpacity(0.7),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(10),
                //     child: Container(
                //       height: 85,
                //       width: 85,
                //       child: Image.network(
                //         imageURL,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
