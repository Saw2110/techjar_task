class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  final String id;
  final String name;
  final String username;
  final String email;
  final Address? address;
  final String phone;
  final String website;
  final Company? company;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json["id"] ?? 0).toString(),
      name: json["name"] ?? "",
      username: json["username"] ?? "",
      email: json["email"] ?? "",
      address:
          json["address"] == null ? null : Address.fromJson(json["address"]),
      phone: json["phone"] ?? "",
      website: json["website"] ?? "",
      company:
          json["company"] == null ? null : Company.fromJson(json["company"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address?.toJson(),
        "phone": phone,
        "website": website,
        "company": company?.toJson(),
      };
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo? geo;

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json["street"] ?? "",
      suite: json["suite"] ?? "",
      city: json["city"] ?? "",
      zipcode: json["zipcode"] ?? "",
      geo: json["geo"] == null ? null : Geo.fromJson(json["geo"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo?.toJson(),
      };
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  final String lat;
  final String lng;

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json["lat"] ?? "",
      lng: json["lng"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  final String name;
  final String catchPhrase;
  final String bs;

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json["name"] ?? "",
      catchPhrase: json["catchPhrase"] ?? "",
      bs: json["bs"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
