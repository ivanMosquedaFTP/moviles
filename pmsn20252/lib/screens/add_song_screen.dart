import 'package:flutter/material.dart';
import 'package:pmsn20252/firebase/songs_firebase.dart';

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

  SongsFirebase? _songsFirebase;

  @override
  void initState() {
    super.initState();
    _songsFirebase = SongsFirebase();
  }

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
          ElevatedButton(
            onPressed: () {
              _songsFirebase!
                  .insertSong({
                    "title": conTitle.text,
                    "duration": conDuration.text,
                    "lyrics": conLyrics.text,
                    "cover":
                        "https://cdn-images.dzcdn.net/images/cover/40c6b089a9ed1463ec23b5177a8b424c/0x1900-000000-80-0-0.jpg",
                  })
                  .then((value) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Cancion guardada")));
                    Navigator.pop(context);
                  });
            },
            child: Text("Add song"),
          ),
        ],
      ),
    );
  }
}
