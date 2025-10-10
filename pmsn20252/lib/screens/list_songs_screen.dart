import 'package:flutter/material.dart';
import 'package:pmsn20252/firebase/songs_firebase.dart';

class ListSongsScreen extends StatefulWidget {
  const ListSongsScreen({super.key});

  @override
  State<ListSongsScreen> createState() => _ListSongsScreenState();
}

class _ListSongsScreenState extends State<ListSongsScreen> {
  SongsFirebase _songsFirebase = SongsFirebase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de canciones")),
      body: StreamBuilder(
        stream: _songsFirebase.getAllSongs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data!.docs[index].get("title"));
              },
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text("Something was wrong retrieving songs."),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}
