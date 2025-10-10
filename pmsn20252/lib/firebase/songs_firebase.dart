import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class SongsFirebase {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  CollectionReference? songsCollection;

  SongsFirebase() {
    songsCollection = _firebaseFirestore.collection("songs");
  }

  Future<void> insertSong(Map<String, dynamic> data) async {
    songsCollection!.doc().set(data);
  }

  Stream<QuerySnapshot> getAllSongs() {
    return songsCollection!.snapshots();
  }

  Future<void> updateSong(Map<String, dynamic> data, String uid) async {
    songsCollection!.doc(uid).update(data);
  }

  Future<void> deleteSong(String uid) async {
    songsCollection!.doc(uid).delete();
  }
}
