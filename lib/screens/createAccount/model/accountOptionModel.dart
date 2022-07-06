// To parse this JSON data, do
//
//     final createAccountModel = createAccountModelFromJson(jsonString);

import 'dart:convert';

CreateAccountModel createAccountModelFromJson(String str) => CreateAccountModel.fromJson(json.decode(str));

String createAccountModelToJson(CreateAccountModel data) => json.encode(data.toJson());

class CreateAccountModel {
  CreateAccountModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory CreateAccountModel.fromJson(Map<String, dynamic> json) => CreateAccountModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.getAccountTypeList,
    this.getBifurcationList,
    this.getStatusList,
    this.getTenderClientList,
    this.getcountriesList,
    this.getaccountSourceList,
    this.getcallAttemptStatus,
    this.getcompanyManpowerList,
    this.getHandledByList,
    this.getcallOutcomeList,
  });

  List<Datum> getAccountTypeList;
  List<Datum> getBifurcationList;
  List<Datum> getStatusList;
  List<Datum> getTenderClientList;
  List<GetcountriesList> getcountriesList;
  List<Datum> getaccountSourceList;
  List<Datum> getcallAttemptStatus;
  List<Datum> getcompanyManpowerList;
  List<Datum> getHandledByList;
  List<Datum> getcallOutcomeList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    getAccountTypeList: List<Datum>.from(json["getAccount_type_List"].map((x) => Datum.fromJson(x))),
    getBifurcationList: List<Datum>.from(json["getBifurcation_List"].map((x) => Datum.fromJson(x))),
    getStatusList: List<Datum>.from(json["getStatus_List"].map((x) => Datum.fromJson(x))),
    getTenderClientList: List<Datum>.from(json["getTender_Client_List"].map((x) => Datum.fromJson(x))),
    getcountriesList: List<GetcountriesList>.from(json["getcountries_List"].map((x) => GetcountriesList.fromJson(x))),
    getaccountSourceList: List<Datum>.from(json["getaccount_Source_List"].map((x) => Datum.fromJson(x))),
    getcallAttemptStatus: List<Datum>.from(json["getcall_attempt_status"].map((x) => Datum.fromJson(x))),
    getcompanyManpowerList: List<Datum>.from(json["getcompany_manpower_list"].map((x) => Datum.fromJson(x))),
    getHandledByList: List<Datum>.from(json["getHandled_by_List"].map((x) => Datum.fromJson(x))),
    getcallOutcomeList: List<Datum>.from(json["getcall_outcome_List"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "getAccount_type_List": List<dynamic>.from(getAccountTypeList.map((x) => x.toJson())),
    "getBifurcation_List": List<dynamic>.from(getBifurcationList.map((x) => x.toJson())),
    "getStatus_List": List<dynamic>.from(getStatusList.map((x) => x.toJson())),
    "getTender_Client_List": List<dynamic>.from(getTenderClientList.map((x) => x.toJson())),
    "getcountries_List": List<dynamic>.from(getcountriesList.map((x) => x.toJson())),
    "getaccount_Source_List": List<dynamic>.from(getaccountSourceList.map((x) => x.toJson())),
    "getcall_attempt_status": List<dynamic>.from(getcallAttemptStatus.map((x) => x.toJson())),
    "getcompany_manpower_list": List<dynamic>.from(getcompanyManpowerList.map((x) => x.toJson())),
    "getHandled_by_List": List<dynamic>.from(getHandledByList.map((x) => x.toJson())),
    "getcall_outcome_List": List<dynamic>.from(getcallOutcomeList.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.optionValue,
  });

  String id;
  String optionValue;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    optionValue: json["option_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "option_value": optionValue,
  };
}

class GetcountriesList {
  GetcountriesList({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory GetcountriesList.fromJson(Map<String, dynamic> json) => GetcountriesList(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
