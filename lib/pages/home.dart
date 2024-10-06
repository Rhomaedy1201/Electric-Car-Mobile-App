import 'package:audioplayers/audioplayers.dart';
import 'package:electric_car_mobile_app/utils/colors.dart';
import 'package:electric_car_mobile_app/utils/space.dart';
import 'package:electric_car_mobile_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List navigationData = ['Status', "Climate", "Battery", "Safety", "Location"];
  var isAvtive = 0;

  late AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    // Listen for player state changes (playing, paused, stopped)
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    // Listen for changes to the total duration of the audio
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // Listen for changes to the position of the audio
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryC,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: primaryC,
          elevation: 0,
          surfaceTintColor: primaryC,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceHeight(25),
                const Text(
                  "Tesla Model X",
                  style: TextStyle(
                    color: whiteC,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.battery_5_bar,
                        color: primaryC_200,
                        size: 25,
                      ),
                    ),
                    spaceWidth(8),
                    const Text(
                      "150 km · Parked",
                      style: TextStyle(
                        color: primaryC_200,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                spaceHeight(10)
              ],
            ),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                color: primaryC_800,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                child: Row(
                  children: [
                    Text(
                      "32°",
                      style: textCustom(primaryC_200, 17, FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 26,
                      child: Image(
                        image: AssetImage("assets/images/weather.png"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            spaceWidth(20),
            Container(
              width: 33,
              height: 33,
              decoration: BoxDecoration(
                color: primaryC_800,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.person_2_sharp,
                color: primaryC_200,
                size: 25,
              ),
            ),
            spaceWidth(15),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceHeight(45),
            SizedBox(
              height: 250,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Positioned(
                    left: -80,
                    right: 40,
                    child: Image(
                      image: AssetImage("assets/images/tesla.png"),
                    ),
                  ),
                  Positioned(
                    right: 70,
                    child: Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        color: primaryC_800,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.lock,
                        color: whiteC,
                        size: 28,
                      ),
                    ),
                  )
                ],
              ),
            ),
            spaceHeight(20),
            SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: navigationData.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () {
                        isAvtive = index;
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          Text(
                            navigationData[index],
                            style: textCustom(
                                isAvtive == index ? whiteC : primaryC_400,
                                17,
                                FontWeight.w500),
                          ),
                          spaceHeight(3),
                          isAvtive == index
                              ? Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: whiteC,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: primaryC_800,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Battery",
                              style: textCustom(whiteC, 17, FontWeight.w700),
                            ),
                            spaceHeight(2),
                            Text(
                              "Last charge 2w ago",
                              style: textCustom(whiteC, 12, FontWeight.w300),
                            ),
                            spaceHeight(15),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 40,
                                  child: Image(
                                    image:
                                        AssetImage("assets/images/Battery.png"),
                                  ),
                                ),
                                spaceWidth(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "212",
                                          style: textCustom(
                                              whiteC, 22, FontWeight.w700),
                                        ),
                                        spaceWidth(3),
                                        Text(
                                          "km",
                                          style: textCustom(
                                              whiteC, 18, FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    spaceHeight(7),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                        color: primaryC_400,
                                        height: 1,
                                        width: 80,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "85",
                                          style: textCustom(
                                              whiteC, 22, FontWeight.w700),
                                        ),
                                        Text(
                                          "%",
                                          style: textCustom(
                                              whiteC, 18, FontWeight.w700),
                                        ),
                                        spaceWidth(4),
                                        Text(
                                          "117kw",
                                          style: textCustom(primaryC_200, 12,
                                              FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  spaceWidth(10),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: primaryC_800,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Climate",
                              style: textCustom(whiteC, 17, FontWeight.w700),
                            ),
                            spaceHeight(2),
                            Text(
                              "Interior 27°",
                              style: textCustom(whiteC, 12, FontWeight.w300),
                            ),
                            spaceHeight(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: primaryC_400,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: whiteC,
                                  ),
                                ),
                                Text(
                                  "20°",
                                  style:
                                      textCustom(whiteC, 30, FontWeight.w800),
                                ),
                                Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: primaryC_400,
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: whiteC,
                                  ),
                                ),
                              ],
                            ),
                            spaceHeight(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 16,
                                      child: Image.asset(
                                          "assets/images/cooling.png"),
                                    ),
                                    spaceWidth(4),
                                    Text(
                                      "Colling",
                                      style: textCustom(
                                          blueC_600, 13, FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: primaryC_400,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "A",
                                      style: textCustom(
                                          whiteC, 20, FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            spaceHeight(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryC_800,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Playing now",
                            style: textCustom(whiteC, 17, FontWeight.w700),
                          ),
                          spaceHeight(5),
                          Text(
                            "Seamless (feat. ke...",
                            style: textCustom(whiteC, 14, FontWeight.w300),
                          ),
                          Text(
                            "Virtual Riot",
                            style:
                                textCustom(primaryC_200, 13, FontWeight.w300),
                          ),
                          spaceHeight(10),
                          Row(
                            children: [
                              Text(
                                DateFormat('HH:mm').format(
                                  DateTime(0).add(position),
                                ),
                                style: textCustom(
                                    primaryC_200, 10, FontWeight.w300),
                              ),
                              spaceWidth(3),
                              SizedBox(
                                width: 80,
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    thumbShape: const RoundSliderThumbShape(
                                        enabledThumbRadius: 6),
                                    trackHeight: 2,
                                    thumbColor: blueC,
                                    activeTrackColor: blueC,
                                    inactiveTrackColor: Colors.grey,
                                    overlayShape:
                                        SliderComponentShape.noOverlay,
                                  ),
                                  child: Slider(
                                    min: 0,
                                    max: duration.inSeconds.toDouble(),
                                    value: position.inSeconds.toDouble(),
                                    onChanged: (value) async {},
                                  ),
                                ),
                              ),
                              spaceWidth(3),
                              Text(
                                DateFormat('HH:mm').format(
                                  DateTime(0).add(duration - position),
                                ),
                                style: textCustom(
                                    primaryC_200, 10, FontWeight.w300),
                              ),
                            ],
                          ),
                          spaceHeight(10),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: primaryC_400,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.skip_previous),
                                      iconSize: 15,
                                      color: whiteC,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: primaryC_400,
                                    child: IconButton(
                                      onPressed: () async {
                                        if (isPlaying) {
                                          await audioPlayer.pause();
                                        } else {
                                          String url =
                                              "https://opengameart.org/sites/default/files/Windless%20Slopes.mp3";
                                          await audioPlayer
                                              .play(UrlSource(url));
                                        }
                                      },
                                      icon: Icon(isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow),
                                      iconSize: 15,
                                      color: whiteC,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: primaryC_400,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.skip_next_sharp),
                                      iconSize: 15,
                                      color: whiteC,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          // SizedBox(
                          //     height: 43,
                          //     child: Image.asset("assets/images/music.png"))
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: primaryC_400,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: whiteC,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "86",
                              style: textCustom(whiteC, 25, FontWeight.w600),
                            ),
                          ),
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: primaryC_400,
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: whiteC,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            child: SizedBox(
                              height: 106,
                              child: Image.asset("assets/images/flawer.png"),
                            ),
                          ),
                          Positioned(
                            left: -10,
                            top: 35,
                            child: Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: primaryC_400,
                              ),
                              child: const Icon(
                                Icons.multitrack_audio,
                                color: whiteC,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            spaceHeight(60)
          ],
        ),
      ),
    );
  }
}
