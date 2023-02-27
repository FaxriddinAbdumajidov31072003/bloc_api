
import 'dart:convert';
import 'package:hive/hive.dart';
part 'model.g.dart';
List<UnversityModel> unversityModelFromJson(String str) => List<UnversityModel>.from(json.decode(str).map((x) => UnversityModel.fromJson(x)));

String unversityModelToJson(List<UnversityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


@HiveType(typeId: 1)
class UniverResponse extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final List<UnversityModel> univers;

  UniverResponse({required this.univers,required this.name, });

  factory UniverResponse.fromJson(dynamic data,String name) {
    List<UnversityModel> listOfUniver = [];
    data.forEach((value) {
      listOfUniver.add(UnversityModel.fromJson(value));
    });
    return UniverResponse(univers: listOfUniver, name: name);
  }
}
@HiveType(typeId: 0)
class UnversityModel extends HiveObject{
  @HiveField(0)
  List<String> domains;
  @HiveField(1)
  String name;
  @HiveField(2)
  List<String> webPages;
  @HiveField(3)
  String country;
  @HiveField(4)
  dynamic stateProvince;
  @HiveField(5)
  String alphaTwoCode;

  UnversityModel({
    required this.domains,
    required this.name,
    required this.webPages,
    required this.country,
    this.stateProvince,
    required this.alphaTwoCode,
  });

  UnversityModel copyWith({
    List<String>? domains,
    String? name,
    List<String>? webPages,
    String? country,
    dynamic stateProvince,
    String? alphaTwoCode,
  }) =>
      UnversityModel(
        domains: domains ?? this.domains,
        name: name ?? this.name,
        webPages: webPages ?? this.webPages,
        country: country ?? this.country,
        stateProvince: stateProvince ?? this.stateProvince,
        alphaTwoCode: alphaTwoCode ?? this.alphaTwoCode,
      );

  factory UnversityModel.fromJson(Map<String, dynamic> json) => UnversityModel(
    domains: List<String>.from(json["domains"].map((x) => x)),
    name: json["name"],
    webPages: List<String>.from(json["web_pages"].map((x) => x)),
    country: json["country"],
    stateProvince: json["state-province"],
    alphaTwoCode: json["alpha_two_code"],
  );

  Map<String, dynamic> toJson() => {
    "domains": List<dynamic>.from(domains.map((x) => x)),
    "name": name,
    "web_pages": List<dynamic>.from(webPages.map((x) => x)),
    "country": country,
    "state-province": stateProvince,
    "alpha_two_code": alphaTwoCode,
  };
}