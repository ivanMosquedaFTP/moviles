import 'package:flutter/material.dart';

class AddSongScreen extends StatefulWidget {
  const AddSongScreen({super.key});

  @override
  State<AddSongScreen> createState() => _AddSongScreenState();
}

class _AddSongScreenState extends State<AddSongScreen> {
  TextEditingController conCover = TextEditingController();
  TextEditingController conDuration = TextEditingController();
  TextEditingController conLyrics = TextEditingController();
  TextEditingController conTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final txtCover = TextField(
      keyboardType: TextInputType.text,
      controller: conCover,
      decoration: InputDecoration(hintText: "Song's cover"),
    );

    final txtDuration = TextField(
      keyboardType: TextInputType.number,
      controller: conDuration,
      decoration: InputDecoration(hintText: "Song's duration in minutes"),
    );

    final txtLyrics = TextField(
      keyboardType: TextInputType.text,
      controller: conLyrics,
      decoration: InputDecoration(hintText: "Song's lyrics"),
    );

    final txtTitle = TextField(
      keyboardType: TextInputType.text,
      controller: conTitle,
      decoration: InputDecoration(hintText: "Song's title"),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Add a new song")),
      body: Column(
        children: [
          txtCover,
          txtDuration,
          txtLyrics,
          txtTitle,
          SizedBox(height: 50),
          ElevatedButton(onPressed: () {}, child: Text("Add song")),
        ],
      ),
    );
  }
}
