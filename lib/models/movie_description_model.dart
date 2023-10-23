class MovieDescriptionModel {
  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String? poster;
  List<Rating?>? ratings;
  String? metascore;
  String? imdbRating;
  String? imdbVotes;
  String? imdbId;
  String? type;
  String? dvd;
  String? boxOffice;
  String? production;
  String? website;
  String? response;

  MovieDescriptionModel(
      {this.title,
      this.year,
      this.rated,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.language,
      this.country,
      this.awards,
      this.poster,
      this.ratings,
      this.metascore,
      this.imdbRating,
      this.imdbVotes,
      this.imdbId,
      this.type,
      this.dvd,
      this.boxOffice,
      this.production,
      this.website,
      this.response});

  MovieDescriptionModel.fromJson(Map<String, dynamic> json) {
    if (json['Ratings'] != null) {
      ratings = <Rating>[];
      json['Ratings'].forEach((v) {
        ratings!.add(Rating.fromJson(v));
      });
    }
    title = json['Title'];
    year = json['Year'];
    rated = json['Rated'];
    released = json['Released'];
    runtime = json['Runtime'];
    genre = json['Genre'];
    director = json['Director'];
    writer = json['Writer'];
    actors = json['Actors'];
    plot = json['Plot'];
    language = json['Language'];
    country = json['Country'];
    awards = json['Awards'];
    poster = json['Poster'];
    metascore = json['Metascore'];
    imdbRating = json['ImdbRating'];
    imdbVotes = json['ImdbVotes'];
    imdbId = json['ImdbId'];
    type = json['Type'];
    dvd = json['Dvd'];
    boxOffice = json['BoxOffice'];
    production = json['Production'];
    website = json['Website'];
    response = json['Response'];
  }
}

class Rating {
  String? source;
  String? value;

  Rating({this.source, this.value});

  Rating.fromJson(Map<String, dynamic> json) {
    source = json['Source'];
    value = json['Value'];
  }
}
