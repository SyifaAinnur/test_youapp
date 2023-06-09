class UserModel {
  UserModel({this.data});

  Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.email,
    this.name,
    this.profile,
    this.password,
    this.v,
  });

  String? id;
  String? email;
  String? name;
  String? password;
  Profile? profile;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "profile": profile?.toJson(),
        "__v": v,
      };
}

class Profile {
  Profile({
    required this.displayName,
    required this.photoProfile,
    required this.gender,
    required this.birthday,
    required this.zodiac,
    required this.shio,
    required this.height,
    required this.weight,
  });

  String displayName;
  String photoProfile;
  String gender;
  String birthday;
  String zodiac;
  String shio;
  String height;
  String weight;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        displayName: json["display_name"] ?? "-",
        photoProfile: json["photo_profile"] ?? "-",
        gender: json["gender"] ?? "-",
        birthday: json["birthday"] ?? "-",
        zodiac: json["zodiac"] ?? "-",
        shio: json["shio"] ?? "-",
        height: json["height"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "display_name": displayName,
        "photo_profile": photoProfile,
        "gender": gender,
        "birthday": birthday,
        "zodiac": zodiac,
        "shio": zodiac,
        "height": height,
        "weight": weight,
      };
}
