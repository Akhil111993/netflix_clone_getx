// To parse this JSON data, do
//
//     final popularResponseModel = popularResponseModelFromJson(jsonString);

import 'dart:convert';

PopularResponseModel popularResponseModelFromJson(String str) =>
    PopularResponseModel.fromJson(json.decode(str));

String popularResponseModelToJson(PopularResponseModel data) =>
    json.encode(data.toJson());

class PopularResponseModel {
  PopularResponseModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.genres,
    this.homepage,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
  });

  bool? adult;
  dynamic backdropPath;
  dynamic belongsToCollection;

  List<Genre>? genres;
  String? homepage;

  dynamic imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;

  dynamic posterPath;
  List<ProductionCompany>? productionCompanies;
  List<dynamic>? productionCountries;
  String? releaseDate;

  List<dynamic>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;

  factory PopularResponseModel.fromJson(Map<String, dynamic> json) =>
      PopularResponseModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompany>.from(
            json["production_companies"]
                .map((x) => ProductionCompany.fromJson(x))),
        productionCountries:
            List<dynamic>.from(json["production_countries"].map((x) => x)),
        releaseDate: json["release_date"],
        spokenLanguages:
            List<dynamic>.from(json["spoken_languages"].map((x) => x)),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
        "homepage": homepage,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "production_companies":
            List<dynamic>.from(productionCompanies!.map((x) => x.toJson())),
        "production_countries":
            List<dynamic>.from(productionCountries!.map((x) => x)),
        "release_date": releaseDate,
        "spoken_languages": List<dynamic>.from(spokenLanguages!.map((x) => x)),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
      };
}

class Genre {
  Genre({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ProductionCompany {
  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}
