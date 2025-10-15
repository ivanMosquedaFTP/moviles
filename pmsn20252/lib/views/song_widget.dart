import 'package:flutter/material.dart';

class SongWidget extends StatefulWidget {
  SongWidget(this.song, {super.key});

  Map<String, dynamic> song;

  @override
  State<SongWidget> createState() => _SongWidgetState();
}

class _SongWidgetState extends State<SongWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.black,
      ),
      child: Row(
        children: [
          FadeInImage(
            placeholder: AssetImage("assets/loadingGif.gif"),
            image: NetworkImage(widget.song["cover"]),
          ),
          ListTile(
            title: Text(widget.song["title"]),
            subtitle: Text(widget.song["duration"]),
          ),
        ],
      ),
    );
  }
}
