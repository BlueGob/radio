import 'package:flutter/material.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:flutter_radio_player/models/frp_source_modal.dart';

import 'drpcontrol.dart';
import 'frpsource.dart';


class FRPlayer extends StatefulWidget {
  final FlutterRadioPlayer flutterRadioPlayer;
  final FRPSource frpSource;
  final bool useIcyData;

  const FRPlayer({
    Key? key,
    required this.flutterRadioPlayer,
    required this.frpSource,
    required this.useIcyData,
  }) : super(key: key);

  @override
  State<FRPlayer> createState() => _FRPlayerState();
}

class _FRPlayerState extends State<FRPlayer> {
  int currentIndex = 0;
  String frpStatus = "flutter_radio_stopped";

  @override
  void initState() {
    super.initState();
    widget.flutterRadioPlayer.useIcyData(widget.useIcyData);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: height*0.68,
          width: width,
          child: FRPSourceList(
            flutterRadioPlayer: widget.flutterRadioPlayer,
            frpSource: widget.frpSource,
          ),
        ),
        FRPPlayerControls(
          flutterRadioPlayer: widget.flutterRadioPlayer,
          addSourceFunction: () =>
              widget.flutterRadioPlayer.addMediaSources(widget.frpSource),
          updateCurrentStatus: (String status) => frpStatus = status,
          nextSource: () => {},
          prevSource: () => {},
        ),

      ],
    );
  }
}
