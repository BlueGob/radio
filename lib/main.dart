import 'package:flutter/material.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:flutter_radio_player/models/frp_source_modal.dart';

import 'frpplayer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radio',
      theme: ThemeData(

        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Radio Tunisie'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FlutterRadioPlayer _flutterRadioPlayer = FlutterRadioPlayer();
  final FRPSource frpSource = FRPSource(
    mediaSources: <MediaSources>[
      MediaSources(
          url: "https://radio.mosaiquefm.net/mosalive?1683219817914",
          description: "https://yt3.googleusercontent.com/ytc/AGIKgqN8BCZYDeFIhImRoLW4Od-FCzr-HHT-VsPtgYuhng=s900-c-k-c0x00ffffff-no-rj",
          isPrimary: true,
          title: "Mosaique FM",
          isAac: true
      ),
      MediaSources(
          url: "https://radio.shemsfm.net/shems?1683221076834",
          description: "https://i0.wp.com/lapresse.tn/wp-content/uploads/2020/01/logo-shems-fm-640x411.gif?fit=850%2C491&ssl=1",
          isPrimary: false,
          title: "Chams FM",
          isAac: true
      ),
      MediaSources(
          url: "rtstream.tanitweb.com/nationale?1683228419844",
          description: "https://upload.wikimedia.org/wikipedia/commons/5/54/Al_Idaa_Al_Watania_FM.png",
          isPrimary: false,
          title: "National",
          isAac: true
      ),
      MediaSources(
          url: "https://live.ifm.tn/radio/8000/ifmlive?1585267848&1683224008520",
          description: "https://upload.wikimedia.org/wikipedia/fr/6/69/Logo_n%C3%A9gatif_avec_contour.png",
          isPrimary: false,
          title: "IFM",
          isAac: true
      ),
      MediaSources(
          url: "https://streaming2.toutech.net/jawharafm?1683224082718",
          description: "https://upload.wikimedia.org/wikipedia/commons/9/9f/Logo_Jawhara_FM.jpg",
          isPrimary: false,
          title: "Jawhra FM",
          isAac: true
      ),
      MediaSources(
          url: "https://streaming.diwanfm.net/stream?1683224132247",
          description: "https://diwanfm.net/template/images/share.png",
          isPrimary: false,
          title: "Diwan fm",
          isAac: true
      ),
    ],
  );

@override
void initState(){
  _flutterRadioPlayer.initPlayer();
  _flutterRadioPlayer.addMediaSources(frpSource);

  super.initState();


}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  FRPlayer(
                    flutterRadioPlayer: _flutterRadioPlayer,
                    frpSource: frpSource,
                    useIcyData: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
