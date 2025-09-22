class MovieDao {
  int? idMovie;
  String? nameMovie, time, releaseDate;

  MovieDao({this.idMovie, this.nameMovie, this.time, this.releaseDate});

  factory MovieDao.fromMap(Map<String, dynamic> map) {
    return MovieDao(
      idMovie: map['idMovie'],
      nameMovie: map['nameMovie'],
      time: map['time'],
      releaseDate: map['releaseDate'],
    );
  }
}
