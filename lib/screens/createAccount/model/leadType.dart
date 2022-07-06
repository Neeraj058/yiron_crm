// To parse this JSON data, do
//
//     final leadTypeModel = leadTypeModelFromJson(jsonString);

import 'dart:convert';

LeadTypeModel leadTypeModelFromJson(String str) => LeadTypeModel.fromJson(json.decode(str));

String leadTypeModelToJson(LeadTypeModel data) => json.encode(data.toJson());

class LeadTypeModel {
  LeadTypeModel({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory LeadTypeModel.fromJson(Map<String, dynamic> json) => LeadTypeModel(
    status: json["status"],
    data: json["data"]!=null?   List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))):null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.optionValue,
    this.parentId,
  });

  String id;
  String optionValue;
  String parentId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    optionValue: json["option_value"],
    parentId: json["parent_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "option_value": optionValue,
    "parent_id": parentId,
  };
}
