import 'package:flutter/material.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:flutter_radio_player/models/frp_source_modal.dart';

class FRPSourceList extends StatefulWidget {
  final FlutterRadioPlayer flutterRadioPlayer;
  final FRPSource frpSource;

  const FRPSourceList({
    Key? key,
    required this.flutterRadioPlayer,
    required this.frpSource,
  }) : super(key: key);

  @override
  State<FRPSourceList> createState() => _FRPSourceListState();
}

class _FRPSourceListState extends State<FRPSourceList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.frpSource.mediaSources?.length,
        itemBuilder: (context, index) {
          MediaSources mediaItem = widget.frpSource.mediaSources![index];
          return InkWell(
            onTap: () => {
              setState(
                    () => {
                  currentIndex = index,
                  widget.flutterRadioPlayer.seekToMediaSource(index, true),
                  widget.flutterRadioPlayer.useIcyData(true),
                  // widget.flutterRadioPlayer.
                },
              ),

          },
            child: Container(
              margin: const EdgeInsets.all(5),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Card(
                    elevation: 18.0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.all(8.0),
                    child: Image.network(
                      mediaItem.description!,
                      fit: BoxFit.cover,
                      height: 200.0,
                      width: width-50,
                    ),
                  ),
                  Text(
                    mediaItem.title!,
                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ),
          );
        },
      ),
    );
  }
}