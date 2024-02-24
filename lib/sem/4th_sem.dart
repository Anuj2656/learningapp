import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FourthSem extends StatefulWidget {
  const FourthSem({Key? key}) : super(key: key);

  @override
  State<FourthSem> createState() => _FourthSemState();
}

class _FourthSemState extends State<FourthSem> {
  final FlickManager flickManager = FlickManager(
    videoPlayerController: VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    ),
  );
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:[ Color(0xFF0f17ad),
                  Colors.white,
                ],
                begin: const FractionalOffset(0.0, 0.4),
                end: Alignment.topRight,

              )
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top:40,left:20,right: 30),
                width: MediaQuery.of(context).size.width,
                height:300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        },
                          icon:Icon(Icons.arrow_back_ios,
                              size:20,
                              color: Colors.black
                          ),
                        ),
                        Expanded(child: Container()),
                        Icon(Icons.info_outline, size:20,
                            color: Colors.black
                        ),
                      ],
                    ),
                    SizedBox(height:30),
                    Text("Notes Regarding",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height:5),
                    Text("your 4th semester",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height:50,),
                    Row(
                        children:[
                          Container(
                            width:90,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors:[ Colors.white10,
                                    Colors.white24,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,

                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.timer,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  "68 min",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width:20,),
                          Container(
                            width:200,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors:[ Colors.white10,
                                    Colors.white24,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,

                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.handyman_outlined,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  "4th Semster Notes",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ]
                    ),
                  ],
                ),
              ),
              Expanded(child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height:10),
                    Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Text("4th Semester : All Video",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        // Expanded(child: Container()),
                        SizedBox(width: 60,),
                        Row(
                          children: [
                            Icon(Icons.loop, size:30,color:Colors.grey),
                          ],
                        )
                      ],
                    ),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: FlickVideoPlayer(flickManager: flickManager),
                    ),
                  ],
                ),
              ),
              ),
            ],
          ),
        )
    );
  }
}

