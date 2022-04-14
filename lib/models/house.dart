import 'package:ekrilli_app/models/user.dart';

class House {
  int? id;
  String? houseType;
  String? title;
  String? description;
  int? pricePerDay;
  double? locationLatitude;
  double? locationLongitude;
  bool? isAvailable;
  int? stars;
  int? numReviews;
  DateTime? createdAt;
  User? owner;
  String? city;
  List<String>? pictures;

  House(
      {this.id,
      this.houseType,
      this.title,
      this.description,
      this.pricePerDay,
      this.locationLatitude,
      this.locationLongitude,
      this.isAvailable,
      this.stars,
      this.numReviews,
      this.createdAt,
      this.owner,
      this.city,
      this.pictures});

  House.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    houseType = json['houseType'];
    title = json['title'];
    description = json['description'];
    pricePerDay = json['price_per_day'];
    locationLatitude = json['location_latitude'];
    locationLongitude = json['location_longitude'];
    isAvailable = json['isAvailable'];
    stars = json['stars'];
    numReviews = json['numReviews'];
    createdAt = DateTime.parse(json['created_at']);
    owner = User.fromJson(json['owner']);
    for (var item in (json['pictures'] as List)) {
      pictures?.add(item['picture']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['houseType'] = houseType;
    data['title'] = title;
    data['description'] = description;
    data['price_per_day'] = pricePerDay;
    data['location_latitude'] = locationLatitude;
    data['location_longitude'] = locationLongitude;
    data['isAvailable'] = isAvailable;
    data['stars'] = stars;
    data['numReviews'] = numReviews;
    data['city'] = city;
    data['pictures'] = pictures;
    return data;
  }
}