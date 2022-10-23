import 'package:converter/src/core/constants/api_constants.dart';
import 'package:objectbox/objectbox.dart';

class CountryModel {
  CountryModel({
    this.country,
  });

  List<CountryResult>? country;

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    List<CountryResult> data = [];
    (json["results"] as Map).forEach((key, value) {
      data.add((CountryResult.fromJson(value)));
    });
    return CountryModel(
      country: data,
    );
  }
}

@Entity()
class CountryResult {
  CountryResult({this.alpha3, this.currencyId, this.currencyName, this.currencySymbol, this.id, this.name, this.uid, this.image});
  int? id;
  String? alpha3;
  String? currencyId;
  String? currencyName;
  String? currencySymbol;
  @Unique()
  String? uid;
  String? name;
  String? image;

  factory CountryResult.fromJson(Map<String, dynamic> json) => CountryResult(
      alpha3: json["alpha3"],
      currencyId: json["currencyId"],
      currencyName: json["currencyName"],
      currencySymbol: json["currencySymbol"],
      uid: json["id"],
      name: json["name"],
      image: "${ApiConstants.imageURL}${json["id"].toLowerCase()}.png");

  Map<String, dynamic> toJson() => {
        "alpha3": alpha3,
        "currencyId": currencyId,
        "currencyName": currencyName,
        "currencySymbol": currencySymbol,
        "id": uid,
        "name": name,
      };
}
