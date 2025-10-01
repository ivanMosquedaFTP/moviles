import 'package:flutter/material.dart';
import 'package:pmsn20252/database/movies_database.dart';
import 'package:pmsn20252/models/movie_dao.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  MoviesDatabase? moviesDb;
  DateTime selectedDate = DateTime.now();
  TextEditingController conTitle = TextEditingController();
  TextEditingController conTime = TextEditingController();
  TextEditingController conRelease = TextEditingController();

  @override
  void initState() {
    super.initState();
    moviesDb = MoviesDatabase();
  }

  @override
  Widget build(BuildContext context) {
    MovieDao? obj;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      obj = ModalRoute.of(context)!.settings.arguments as MovieDao;
      conTitle.text = obj.nameMovie!;
      conTime.text = obj.time!;
      conRelease.text = obj.releaseDate!;
    }

    conRelease.text = selectedDate.toLocal().toString().split(' ')[0];

    final txtTitle = TextFormField(
      controller: conTitle,
      decoration: InputDecoration(hintText: "Titulo de la pelicula."),
    );

    final txtTime = TextFormField(
      controller: conTime,
      decoration: InputDecoration(hintText: "Duracion de la pelicula"),
    );

    final txtRelease = TextFormField(
      controller: conRelease,
      decoration: InputDecoration(hintText: "Fecha de lanzamiento"),
      onTap: () => _selectedDate(context),
    );

    final btnGuardar = ElevatedButton(
      onPressed: () {
        if (obj == null) {
          moviesDb!
              .INSERT("tblMovies", {
                "nameMovie": conTitle.text,
                "time": conTime.text,
                "releaseDate": conRelease.text,
              })
              .then((value) => Navigator.pop(context));
        } else {
          moviesDb!
              .UPDATE("tblMovies", {
                "idMovie": obj.idMovie,
                "nameMovie": conTitle.text,
                "time": conTime.text,
                "releaseDate": conRelease.text,
              })
              .then((value) => Navigator.pop(context));
        }
      },
      child: Text("Guardar"),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Insertar pelicula")),
      body: ListView(
        shrinkWrap: true,
        children: [txtTitle, txtTime, txtRelease, btnGuardar],
      ),
    );
  }

  _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2026),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
